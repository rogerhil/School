class StudentClassController < ApplicationController
  
  before_filter :teacher_required, :only => [ :new, :create, :edit, :update, :destroy ]

  def new
  	@student_class = StudentClass.new
  	@subjects = Subject.all
  	@students = Student.where('student_class_id IS NULL')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @subject }
    end
  end

  def edit
    @student_class = StudentClass.find(params[:id])
    @subjects = Subject.all
    @students = Student.where('student_class_id IS NULL or student_class_id = :scid', :scid => @student_class.id)
    @class_subject_ids = @student_class.subject_class_teacher.collect{|sc| sc.subject.id}
    class_subject_teacher  = @student_class.subject_class_teacher.select(['subject_id', 'teacher_id'])
    @class_subject_teacher_ids = {}
    class_subject_teacher.each do |cst|
      if not @class_subject_teacher_ids[cst.subject_id]
        @class_subject_teacher_ids[cst.subject_id] = []
      end
      @class_subject_teacher_ids[cst.subject_id].push cst.teacher_id
    end
    
  end

  def create
    @student_class = StudentClass.new(params[:student_class])
    respond_to do |format|
      if @student_class.save
      	save_subject_class_teacher(params, @student_class)
      	save_students(params, @student_class)
        format.html { redirect_to @student_class, :notice => 'Class was successfully created.' }
        format.json { render :json => @student_class, :status => :created, :location => @student_class }
      else
  	    @subjects = Subject.all
  	    @students = Student.where('student_class_id IS NULL')
        format.html { render :action => "new" }
        format.json { render :json => @student_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @student_class = StudentClass.find(params[:id])

    respond_to do |format|
      if @student_class.update_attributes(params[:student_class])
      	@student_class.subject_class_teacher.clear
      	save_subject_class_teacher(params, @student_class)
      	save_students(params, @student_class)
        format.html { redirect_to @student_class, :notice => 'The class was successfully updated.' }
        format.json { head :no_content }
      else
	    @subjects = Subject.all
	    @students = Student.where('student_class_id IS NULL OR student_class_id == ' + String(@student_class.id))
	    @class_subject_ids = @student_class.subject_class_teacher.collect{|sc| sc.subject.id}
	    class_subject_teacher  = @student_class.subject_class_teacher.select(['subject_id', 'teacher_id'])
        @class_subject_teacher_ids = {}
	    class_subject_teacher.each do |cst|
	      if not @class_subject_teacher_ids[cst.subject_id]
	        @class_subject_teacher_ids[cst.subject_id] = []
	      end
	      @class_subject_teacher_ids[cst.subject_id].push cst.teacher_id
	    end
        format.html { render :action => "edit" }
        format.json { render :json => @student_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
  	if params[:filter_by] and params[:name] and ['name', 'users.name', 'subjects.name'].include? params[:filter_by]
  	  escaped_name = params[:name].gsub('%', '\%').gsub('_', '\_')
      @student_classes = StudentClass.includes(:subject_class_teacher => [{:teacher => :user}, :subject])\
                                     .find(:all, :conditions => [ params[:filter_by] + " like ?", '%' + params[:name] + '%' ] )
  	else
      @student_classes = StudentClass.all
	end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @student_classes }
    end
  end

  def show
	@student_class = StudentClass.find(params[:id])
	@students = Student.where(:student_class_id => @student_class.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student_class }
    end
  end

  def destroy
    @student_class = StudentClass.find(params[:id])
    @student_class.destroy

    respond_to do |format|
      format.html { redirect_to student_classes_url }
      format.json { head :no_content }
    end
  end

  def save_subject_class_teacher(params, student_class)
    subject_ids = params[:subject] ? params[:subject] : []
    subject_ids.each do |subject_id|
  	  teacher_id = params['teacher__subject_' + subject_id]
  	  if not teacher_id.empty?
  	  	sct = SubjectClassTeacher.new
  	  	sct.teacher_id = Integer(teacher_id)
  	  	sct.subject_id = Integer(subject_id)
  	  	sct.student_class = student_class
  	  	sct.save
  	  end
  	end
  end

  def save_students(params, student_class)
  	sts = Student.where(:student_class_id => student_class.id)
  	sts.update_all(:student_class_id => nil)
    students_ids = params[:student] ? params[:student] : []
    students_ids.each do |student_id|
      student = Student.find(student_id)
      student.student_class = student_class
      student.save
    end
  end

end

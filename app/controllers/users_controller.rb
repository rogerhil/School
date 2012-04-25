class UsersController < ApplicationController

  before_filter :admin_required, :only => [ :new, :create, :edit, :update, :destroy ]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  def new
    @user = User.new
    @subjects = Subject.all
    respond_to do |format|
      format.html
      format.json { render :json => @user }
    end
  end

  def create
  	puts params
    @user = User.new(params[:user])
    respond_to do |format|
      user_type = params[:type]
      if user_type == 'admin'
        @user.admin = true
      end
      if @user.save
      	case user_type
      	  when 'teacher'
      	  	@teacher = Teacher.new
      	  	@teacher.user = @user
      	  	@teacher.save
			subjects = params[:subjects]
			save_subjects(@teacher, subjects)

      	  when 'student'
      	  	@student = Student.new
      	  	@student.user = @user
      	  	@student.save
      	end

        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
      	@subjects = Subject.all
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
	@user = User.find(params[:id])
	@subjects = []
	if @user.teacher
		@subjects = @user.teacher.teacher_subject.collect{|s| s.subject.name}
		puts @subjects
	end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    @subjects = Subject.all
    @teachersubject_ids = @user.teacher ? @user.teacher.teacher_subject.select('subject_id').collect{|s| s.subject_id} : []
    puts @teachersubject_ids
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
      	if @user.teacher and params[:subjects]
      	  @user.teacher.teacher_subject.clear
          save_subjects(@user.teacher, params[:subjects])
      	end
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
      	@subjects = Subject.all
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def save_subjects(teacher, subjects)
    subjects.each do |subject|
      ts = TeacherSubject.new
      ts.teacher = teacher
      ts.subject_id = Integer(subject)
	  ts.save
	end
  end

end

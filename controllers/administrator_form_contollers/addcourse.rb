get "/add_course" do
   @course = Course.new
   erb :"administrator_form_views/addcourse"
end

post "/add_course" do
   @course = Course.new
   @course.load(params)

   if @course.valid?
       @course.save_changes
       redirect "/course_search"
    end

    erb :"administrator_form_views/addcourse"
end

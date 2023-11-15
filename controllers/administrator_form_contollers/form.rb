get '/course_search' do
    @course = params.fetch("course", "").strip

    @course_result = if @course.empty?
                        Course.all
                     else
                        Course.where(Sequel.like(:name, "%#{@course}%"))
                     end
                     
    erb :"administrator_form_views/form"
end
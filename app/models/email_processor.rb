class EmailProcessor
  def self.process(email)
    @user = @project.contents.find_by(id: params[:id])
    if @user
      get_inbox
      if @inbox
        Note.create!({ content: email.body, title: email.subject, project_id: @inbox.id })
      end
    end
  end
end

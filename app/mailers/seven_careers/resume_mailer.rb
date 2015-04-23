module SevenCareers
  class ResumeMailer < ApplicationMailer
    def send_resume(candidate)
      @candidate = candidate
      mail(to: 'ahmednagy14@gmail.com', subject: "#{@candidate.name} Resume")
    end
  end
end

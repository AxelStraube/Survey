require('spec_helper')

describe(Survey) do
  describe('#questions') do
    it("tells which questions belong to it") do
      survey = Survey.create({:name => "survey"})
      question1 = Question.create({:question => "question1", :survey_id => survey.id})
      question2 = Question.create({:question => "question2", :survey_id => survey.id})
      expect(survey.questions()).to(eq([question1, question2]))
    end
  end

  it("capitalizes the name of the survey") do
    survey = Survey.create({:name => "opinions"})
    expect(survey.name()).to(eq("Opinions"))
  end
end

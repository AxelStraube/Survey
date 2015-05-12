require('spec_helper')

describe(Question) do
  it("belongs to a specific survey") do
    test_survey = Survey.create({:name => "survey"})
    question = Question.create({:question => "question?", :survey_id => test_survey.id})
    expect(question.survey()).to(eq(test_survey))
  end
end

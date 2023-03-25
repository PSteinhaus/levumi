desc "Add or re-add mock-results for a certain group on the evaluation tests."
task 'seed_evaluation' => :environment do
  # group id found by hand in the database
  g_id = 2

  # first check whether assessments on these tests, for this group, already exist and delete them
  for i in 0..9 do
    a = Assessment.where(group_id: g_id, test_id: Test.find_by_shorthand('Thesis_Eval_'+i.to_s).id)
    a.each do |assessment|
      assessment.destroy
    end
  end
  a = Assessment.where(group_id: g_id, test_id: Test.find_by_shorthand('Thesis_Eval_Erl').id)
  a.each do |assessment|
    assessment.destroy
  end
  a = Assessment.where(group_id: g_id, test_id: Test.find_by_shorthand('Thesis_Eval_Niv').id)
  a.each do |assessment|
    assessment.destroy
  end

  # define the parts that won't change for any of the results
  # these won't really matter for the evaluation, as they only show up on "Messungen->Details"
  # that's why we leave them the same
  rep = {
    "trend": 0,
    "negative": ["InVo_Text_S3_N2_A3d", "InVo_Text_S3_N1_A3d", "InVo_Text_S3_N3_A3a"],
    "positive": ["InVo_Id_S2_N1_A7g", "InVo_Id_S2_N2_A5c", "InVo_Id_S1_N3_A5a", "InVo_Id_S3_N1_A8c"]
  }

  # list of IDs of affected students:
  s_ids = Group.find(g_id).students.map { |s| s.id }

  # define the sequence of correctness results per student
  corr_rows = [
    [0.20, 0.18, 0.21, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59],
    [0.14, 0.21, 0.23, 0.24, 0.17, 0.27, 0.31, 0.25, 0.34, 0.49],
    [0.21, 0.16, 0.17, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59], # TODO: change other rows
    [0.23, 0.25, 0.20, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59],
    [0.11, 0.13, 0.14, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59],
    [0.08, 0.14, 0.10, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59],
    [0.13, 0.10, 0.12, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59],
    [0.18, 0.12, 0.14, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59],
    [0.16, 0.18, 0.19, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59],
    [0.12, 0.12, 0.16, 0.29, 0.23, 0.37, 0.42, 0.56, 0.63, 0.59]
  ]
  # the date when the latest result was measured
  end_date = DateTime.new(2023,3,30)

  # for each test add the same student sequences of results
  for i in 0..9 do
    # create the assessment that we want to fill
    a = Assessment.create(group_id: g_id, test_id: Test.find_by_shorthand('Thesis_Eval_'+i.to_s).id)
    # go through all students
    for j in 0..9 do
      s = Student.find(s_ids[j])
      # and per student go through all their results
      for k in 0..9 do
        c_row = corr_rows[j].reverse # reverse because we go from last to first result
        a.results.create(
          student_id: s.id,
          test_date: end_date - 7 * k,
          views: {
            'correctness': c_row[k]
          },
          report: rep,
          data: []
        )
      end
    end
  end

  # add the results for the two final special tests as well
  a1 = Assessment.create(group_id: g_id, test_id: Test.find_by_shorthand('Thesis_Eval_Erl').id)
  a2 = Assessment.create(group_id: g_id, test_id: Test.find_by_shorthand('Thesis_Eval_Niv').id)
  # go through all students
  for j in 0..9 do
    s = Student.find(s_ids[j])
    # and per student go through all their results
    for k in 0..9 do
      c_row = corr_rows[j].reverse # reverse because we go from last to first result
      a1.results.create(
        student_id: s.id,
        test_date: end_date - 7 * k,
        views: {
          'correctness': c_row[k]
        },
        report: rep,
        data: []
      )
      a2.results.create(
        student_id: s.id,
        test_date: end_date - 7 * k,
        views: {
          'correctness': c_row[k]
        },
        report: rep,
        data: []
      )
    end
  end

end

module User
  module Operation
    class Create < Trailblazer::Operation
      step Model::Find(UserAccount, find_by: :email),
           Output(:failure) => Track(:success),
           Output(:success) => End(:failure)
      step Model::Build(UserAccount, :new)

      step Contract::Build(constant: User::Form::Create)
      step Contract::Validate()
      step Contract::Persist()
    end
  end
end

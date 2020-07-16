
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # we want to test whether validations exist 
  # EXAMPLE: 
  # RSpec.describe Person, type: :model do
    #it { is_expected.to validate_presence_of(:name) }
  # end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_uniqueness_of(:username)}
  it { should validate_length_of(:password).is_at_least(6) }

  subject(:wombat) { User.create(
    username: 'wombat', 
    password: 'password'
  )}

end

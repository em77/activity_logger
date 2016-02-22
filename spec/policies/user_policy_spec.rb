require "rails_helper"

describe UserPolicy do
  subject {UserPolicy}

  let(:current_user) {FactoryGirl.build_stubbed :user}
  let(:second_user) {FactoryGirl.build_stubbed :user}
  let(:admin) {FactoryGirl.build_stubbed :user, :admin}

  permissions :index? do
    it "denies access if not admin" do
      expect(subject).not_to permit(current_user)
    end

    it "gives access for admin" do
      expect(subject).to permit(admin)
    end
  end

  permissions :show? do
    it "prevents second_user from seeing show page" do
      expect(subject).not_to permit(current_user, second_user)
    end

    it "allows user to see own show page" do
      expect(subject).to permit(current_user, current_user)
    end

    it "allows admin to see show page of other users" do
      expect(subject).to permit(admin)
    end
  end
end

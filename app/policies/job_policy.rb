class JobPolicy < ApplicationPolicy
 def index?
  true
 end

 def show?
  true
 end

 def new?
  user.recruiter?
 end

 def create?
  user.recruiter?
 end

 def edit?
  user.recruiter? && record.user == user
 end

 def update?
  edit?
 end

 def destroy?
  edit?
 end
end

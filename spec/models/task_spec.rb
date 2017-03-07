require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do 
    it "should switch complete to false if it began as true" do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it began as false" do 
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end
  describe '#toggle_favorite' do 
    it 'should switch favorite to true if it is false' do 
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true) 
    end 
    it 'should switch favorite to false if it is true' do 
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
  end 
  describe '#overdue' do 
    it 'should return time greater than deadline' do 
      task = Task.new(deadline: Time.now - 2.days)
      expect(task.overdue?).to eq(true)
    end 
  end 
  describe '#increment_priority' do
    it 'should update priority to priority + 1' do 
      task = Task.new(priority: 6)
      task.increment_priority!
      expect(task.priority).to eq(7)
    end 
  end 
  describe '#decrement_priority' do
    it 'should update priority to priority - 1' do 
      task = Task.new(priority: 3)
      task.decrement_priority!
      expect(task.priority).to eq(2)
    end 
  end 
  describe '#snooze_hour' do 
    it 'should update deadline to deadline + 1 hour' do
      deadline = Time.now
      task = Task.new(deadline: deadline)
      task.snooze_hour!
      expect(task.deadline).to eq(deadline + 1.hour)
    end 
  end 
end

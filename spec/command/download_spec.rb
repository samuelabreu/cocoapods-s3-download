require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Download do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ download }).should.be.instance_of Command::Download
      end
    end
  end
end


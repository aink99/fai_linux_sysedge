# # encoding: utf-8

# Inspec test for recipe .::password_policy

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
#
#
#
#
#
#

describe processes('sysedge') do
  it { should exist }
end

describe processes('sysedge') do
  its('entries.length') { should eq 1 }
end

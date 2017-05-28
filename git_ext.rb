#!/usr/bin/env ruby

# ex: git_ext
# # get issue-id from branchname by regexp.
# issue_pattern /issue_([\d]+)$/ do
#   $1
# end
#
# # get a url of an issue page.
# issue_url do |issue|
#   "http://issue.com/view/#{issue}"
# end

module GitExt

  module Lib
    def error(message)
      puts message
      exit!
    end

    def find_from_branch(g, local_or_remote, branch_name)
      branches = (local_or_remote == :local ? g.branches.local : g.branches.remote)

      # TODO 複数のブランチがヒットした場合
      branches.select { |b| b.name =~ /#{branch_name}$/ }.first
    end

  end



  class Config

    attr_reader :issue_pattern,  :issue_block, :issue_url_block, :pullreq_url_block

    def initialize
    end

    def set_issue_pattern(pattern, &block)
      @issue_pattern = pattern
      @issue_block = block
    end

    def issue_url(&block)
      @issue_url_block = block
    end

    def pullreq_url(&block)
      @pullreq_url_block = block
    end

    def read(git_ext_path)
      self.instance_eval File.read(git_ext_path)
    end

  end

end


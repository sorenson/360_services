

if ENV['SHOW_STEPS']
  module Cucumber
    module RbSupport
      class RbStepDefinition
        alias :alias_for_invoke :invoke
        def invoke(args)
          $scenario_names ||= {}
          scenario_name = @rb_language.instance_variable_get("@step_mother").instance_variable_get("@current_scenario").name
          $scenario_names[scenario_name] ||= []

          step_file_name = File.join("#{File.dirname(__FILE__)}/../../", file_colon_line.split(":").first)
          line_num = file_colon_line.split(":").last

          source = File.open(step_file_name, "r") do |f|
            f.readlines
          end

          source.each_with_index do |line, i|
            if i >= line_num.to_i
              break if line.match(/^end\s+/)
              $scenario_names[scenario_name] << line
            end
          end
          alias_for_invoke(args)
        end
      end
    end
  end
  at_exit do
    doc_lines = []
    $scenario_names.each do |name, lines|
      doc_lines << "# #{name}\n"
      lines.each do |line|
        doc_lines << line
      end
      doc_lines << "\n"
    end

    File.open(File.join(File.dirname(__FILE__), '..', '..', 'doc', 'steps_code.rb'), 'w') do |f|
      f.write doc_lines.join("")
    end

  end
end
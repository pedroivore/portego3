module Commands
  
    #
  # Export command logic
  #
  def cmd_export(*args)
    if (args.length < 1)
      cmd_export_help
      return
    end
    
    format_type = args[0]
    case format_type
    when "-h", "-?"
      cmd_export_help
      return
    when "graphviz"
      require "exporters/graphviz_exporter"
      gv_generator = GraphvizExporter.new(driver.interface.working_values)
      gv_generator.export()
    else
      print_error("Invalid export format.")
      return
    end
    
    
  end
  
  #
  # Export command help
  #
  def cmd_export_help(*args)
    print_status("Export things at and below current selection into a format.")
    print_status("Command    : export")
    print_status("Description: export things that are at and below the current selection into another format.")
    print_status("Usage      : 'export <format>'")
  end
  
  
end
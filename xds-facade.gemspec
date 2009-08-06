# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{xds-facade}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Project Laika"]
  s.date = %q{2009-08-06}
  s.email = %q{dev@projectlaika.org}
  s.files = [
    "lib/apache-mime4j-0.5.jar",
     "lib/commons-codec-1.3.jar",
     "lib/commons-httpclient-3.1.jar",
     "lib/commons-logging-1.1.1.jar",
     "lib/mime/mime_message_parser.rb",
     "lib/xds-facade.rb",
     "lib/xds/affinity_domain_config.rb",
     "lib/xds/author.rb",
     "lib/xds/coded_attribute.rb",
     "lib/xds/document_registry_service.rb",
     "lib/xds/document_repository_service.rb",
     "lib/xds/helper.rb",
     "lib/xds/metadata.rb",
     "lib/xds/mtom_xop_request.rb",
     "lib/xds/provide_and_register_document_set_b.rb",
     "lib/xds/provide_and_register_document_set_b_xop.rb",
     "lib/xds/provide_and_register_document_set_b_xop_response.rb",
     "lib/xds/registry_stored_query_request.rb",
     "lib/xds/registry_stored_query_response.rb",
     "lib/xds/retrieve_document_set_request.rb",
     "lib/xds/retrieve_document_set_response.rb",
     "lib/xds/source_patient_info.rb",
     "lib/xds/xds_header.rb",
     "lib/xds/xds_part.rb",
     "lib/xds/xds_request.rb",
     "lib/xds/xds_request_entity.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://projectlaika.org}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Simple interface for XDS for use with JRuby}
  s.test_files = [
    "test/xds/coded_attribute_test.rb",
     "test/xds/source_patient_info_test.rb",
     "test/xds/author_test.rb",
     "test/xds/xml_helper_test.rb",
     "test/xds/retrieve_document_set_request_test.rb",
     "test/xds/affinity_domain_config_test.rb",
     "test/xds/xds_header.rb",
     "test/xds/metadata_test.rb",
     "test/xds/provide_and_register_document_set_b_test.rb",
     "test/xds/registry_stored_query_request_test.rb",
     "test/xds/retrieve_document_set_response_test.rb",
     "test/xds/registry_stored_query_response_test.rb",
     "test/mime/mime_message_parser_test.rb",
     "test/test_helper.rb",
     "test/factories.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uuid>, ["= 2.0.1"])
      s.add_runtime_dependency(%q<builder>, ["= 2.1.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3"])
    else
      s.add_dependency(%q<uuid>, ["= 2.0.1"])
      s.add_dependency(%q<builder>, ["= 2.1.2"])
      s.add_dependency(%q<activesupport>, [">= 2.3"])
    end
  else
    s.add_dependency(%q<uuid>, ["= 2.0.1"])
    s.add_dependency(%q<builder>, ["= 2.1.2"])
    s.add_dependency(%q<activesupport>, [">= 2.3"])
  end
end

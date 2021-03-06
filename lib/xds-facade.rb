if RUBY_PLATFORM =~ /java/
  require 'rubygems'
  require 'builder'
  require 'uuid'
  require 'java'
  begin
    require 'active_support'
  rescue LoadError
    require 'activesupport' # legacy environment
  end
  require 'rexml/document'
  
  require File.expand_path(File.dirname(__FILE__) + '/commons-codec-1.3.jar')
  require File.expand_path(File.dirname(__FILE__) + '/commons-logging-1.1.1.jar')
  require File.expand_path(File.dirname(__FILE__) + '/commons-httpclient-3.1.jar')
  require File.expand_path(File.dirname(__FILE__) + '/apache-mime4j-0.5.jar')
  
  java_import "org.apache.commons.httpclient.HttpClient"
  java_import "org.apache.commons.httpclient.methods.PostMethod"
  java_import "org.apache.commons.httpclient.methods.StringRequestEntity"
  java_import "org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity"
  java_import "org.apache.commons.httpclient.methods.multipart.Part"
  java_import "org.apache.commons.httpclient.methods.multipart.StringPart"
  java_import "org.apache.commons.httpclient.methods.multipart.FilePart"
  java_import "org.apache.james.mime4j.parser.MimeTokenStream"
  java_import "org.apache.james.mime4j.parser.MimeEntityConfig"
  java_import "org.apache.commons.httpclient.util.EncodingUtil"
  
  require File.expand_path(File.dirname(__FILE__) + '/mime/mime_message_parser')

  require File.expand_path(File.dirname(__FILE__) + '/xds/helper')
  require File.expand_path(File.dirname(__FILE__) + '/xds/xds_header')
  require File.expand_path(File.dirname(__FILE__) + '/xds/xds_request')
  require File.expand_path(File.dirname(__FILE__) + '/xds/mtom_xop_request')
  require File.expand_path(File.dirname(__FILE__) + '/xds/author')
  require File.expand_path(File.dirname(__FILE__) + '/xds/coded_attribute')
  require File.expand_path(File.dirname(__FILE__) + '/xds/metadata')
  require File.expand_path(File.dirname(__FILE__) + '/xds/source_patient_info')
  require File.expand_path(File.dirname(__FILE__) + '/xds/xds_part')
  require File.expand_path(File.dirname(__FILE__) + '/xds/xds_request_entity')
  require File.expand_path(File.dirname(__FILE__) + '/xds/provide_and_register_document_set_b')
  require File.expand_path(File.dirname(__FILE__) + '/xds/provide_and_register_document_set_b_xop')
  require File.expand_path(File.dirname(__FILE__) + '/xds/provide_and_register_document_set_b_xop_response')
  require File.expand_path(File.dirname(__FILE__) + '/xds/retrieve_document_set_request')
  require File.expand_path(File.dirname(__FILE__) + '/xds/retrieve_document_set_response')
  require File.expand_path(File.dirname(__FILE__) + '/xds/registry_stored_query_request')
  require File.expand_path(File.dirname(__FILE__) + '/xds/registry_stored_query_response')
  require File.expand_path(File.dirname(__FILE__) + '/xds/affinity_domain_config')
  
else
  warn "xds-facade is only for use with JRuby"
end

module XDS
  COMMON_NAMESPACES = {'xdsb' => "urn:ihe:iti:xds-b:2007", 
                       'soapenv' =>"http://www.w3.org/2003/05/soap-envelope",
                       'wsa' => "http://www.w3.org/2005/08/addressing",
                       'rs' => "urn:oasis:names:tc:ebxml-regrep:xsd:rs:3.0",
                       'xop' => "http://www.w3.org/2004/08/xop/include",
                       'query' => "urn:oasis:names:tc:ebxml-regrep:xsd:query:3.0",
                       'rim' => 'urn:oasis:names:tc:ebxml-regrep:xsd:rim:3.0'}

    
 PROXY_CONFIG = begin
     proxy_config = {}
     host = ENV['xds_proxy'] || ENV['http_proxy']
     if host
         host.try(:gsub!, "http://", "")
         host.try(:gsub!, "https://", "")
     end
     if host 
        host = host.split(":")
        proxy_config = {:host=>host[0],:port=>(host.length>1)?host[1].to_i : 80}        
     end
      proxy_config
    end                       
          
  def self.proxy_config    
       XDS::PROXY_CONFIG 
  end                     
end

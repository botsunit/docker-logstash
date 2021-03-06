
output {
  if [type] == "request-incoming" {
    elasticsearch {
      hosts => ["#ELASTICSEARCH#"]#ELASTICSEARCH_SSL##ELASTICSEARCH_USER##ELASTICSEARCH_PASSWORD#
      index => "request-incoming-%{+YYYY.MM.dd}"
    }
  }
  else if [type] == "request-outgoing" {
    elasticsearch {
      hosts => ["#ELASTICSEARCH#"]#ELASTICSEARCH_SSL##ELASTICSEARCH_USER##ELASTICSEARCH_PASSWORD#
      index => "request-outgoing-%{+YYYY.MM.dd}"
    }
  } else if [type] == "docker-events" {
    elasticsearch {
      hosts => ["#ELASTICSEARCH#"]#ELASTICSEARCH_SSL##ELASTICSEARCH_USER##ELASTICSEARCH_PASSWORD#
      index => "docker-events-%{+YYYY.MM.dd}"
    }
  } else if [type] == "alert" {
    elasticsearch {
      hosts => ["#ELASTICSEARCH#"]#ELASTICSEARCH_SSL##ELASTICSEARCH_USER##ELASTICSEARCH_PASSWORD#
      index => "logstash-alerts-%{+YYYY.MM.dd}"
    }
  } else {
     elasticsearch {
        hosts => ["#ELASTICSEARCH#"]#ELASTICSEARCH_SSL##ELASTICSEARCH_USER##ELASTICSEARCH_PASSWORD#
        index => "logstash-logs-%{+YYYY.MM.dd}"
        template_name => "logstash-template"
        template => "/opt/logstash/templates/logstash-template.json"
     }
  }

  #DEBUG#
}

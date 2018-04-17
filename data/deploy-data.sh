ES_HOST_PORT=$1
curl -X PUT "http://$ES_HOST_PORT/shakespeare" -H 'Content-Type: application/json' -d'
{
 "mappings": {
  "doc": {
   "properties": {
    "speaker": {"type": "keyword"},
    "play_name": {"type": "keyword"},
    "line_id": {"type": "integer"},
    "speech_number": {"type": "integer"}
   }
  }
 }
}
'
curl -X PUT "http://$ES_HOST_PORT/logstash-2015.05.18" -H 'Content-Type: application/json' -d'
{
  "mappings": {
    "log": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
    }
  }
}
'
curl -X PUT "http://$ES_HOST_PORT/logstash-2015.05.19" -H 'Content-Type: application/json' -d'
{
  "mappings": {
    "log": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
    }
  }
}
'
curl -X PUT "http://$ES_HOST_PORT/logstash-2015.05.20" -H 'Content-Type: application/json' -d'
{
  "mappings": {
    "log": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
    }
  }
}
'
curl -H 'Content-Type: application/x-ndjson' -XPOST "$ES_HOST_PORT/bank/account/_bulk?pretty" --data-binary @accounts.json
curl -H 'Content-Type: application/x-ndjson' -XPOST "$ES_HOST_PORT/shakespeare/doc/_bulk?pretty" --data-binary @shakespeare_6.0.json
curl -H 'Content-Type: application/x-ndjson' -XPOST "$ES_HOST_PORT/_bulk?pretty" --data-binary @logs.json

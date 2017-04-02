import GraphiQL from 'graphiql'
import React from 'react'
import ReactDOM from 'react-dom'
import './index.css'
import 'graphiql/graphiql.css'

const graphQLFetcher = params => (
  fetch('/graphql', {
    method: 'post',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(params)
  }).then(response => response.json())
)

ReactDOM.render(
  <GraphiQL fetcher={ graphQLFetcher } />,
  document.getElementById('root')
)

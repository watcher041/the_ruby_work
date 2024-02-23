
import React from 'react';
import { createRoot } from 'react-dom/client';

function App() {
  return (
    <h1>Hello React!</h1>
  )
}

const root = document.getElementById('root');
if (!root) {
  throw new Error('No root element');
}
createRoot(root).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
// import "./controllers"



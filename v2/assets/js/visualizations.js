// Minimal loader for Chart.js auto-initialization
document.addEventListener('DOMContentLoaded', function(){
  if (window.Chart) return; // assume Chart.js included separately
  // Optional: dynamically load Chart.js from CDN for demo only
  var script = document.createElement('script');
  script.src = 'https://cdn.jsdelivr.net/npm/chart.js';
  script.onload = function(){ /* triggers includes when they call Chart */ };
  document.head.appendChild(script);
});

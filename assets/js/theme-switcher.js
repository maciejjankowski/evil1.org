// Theme switcher for evil1.org
(function() {
  const THEMES = {
    hellish: '/assets/css/theme-hellish.css',
    professional: '/assets/css/theme-professional.css'
  };
  function setTheme(theme) {
    let link = document.getElementById('theme-css');
    if (!link) {
      link = document.createElement('link');
      link.rel = 'stylesheet';
      link.id = 'theme-css';
      document.head.appendChild(link);
    }
    link.href = THEMES[theme] || THEMES.hellish;
    localStorage.setItem('evil1-theme', theme);
  }
  function autoDetectTheme() {
    // Example: use time of day for automatic selection
    const hour = new Date().getHours();
    return (hour >= 8 && hour < 18) ? 'professional' : 'hellish';
  }
  window.setTheme = setTheme;
  document.addEventListener('DOMContentLoaded', function() {
    let theme = localStorage.getItem('evil1-theme') || autoDetectTheme();
    setTheme(theme);
    // Add theme switcher UI
    const switcher = document.createElement('div');
    switcher.id = 'theme-switcher';
    switcher.style.position = 'fixed';
    switcher.style.bottom = '18px';
    switcher.style.right = '18px';
    switcher.style.zIndex = '9999';
    switcher.style.background = '#222';
    switcher.style.color = '#fff';
    switcher.style.padding = '8px 14px';
    switcher.style.borderRadius = '8px';
    switcher.style.boxShadow = '0 2px 8px #000';
    switcher.innerHTML = '<b>Theme:</b> ' +
      '<button onclick="setTheme(\'hellish\')">Hellish</button> ' +
      '<button onclick="setTheme(\'professional\')">Professional</button>';
    document.body.appendChild(switcher);
  });
})();

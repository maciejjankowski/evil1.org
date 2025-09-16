self.addEventListener('install', event => {
  event.waitUntil(
    caches.open('evil1-cache-v1').then(cache => {
      return cache.addAll([
        '/',
        '/offline.html',
        '/assets/css/main.css',
        '/assets/icon-192.png',
        '/assets/icon-512.png'
      ]);
    })
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request).then(response => {
      return response || fetch(event.request).catch(() => caches.match('/offline.html'));
    })
  );
});

// ===========================================
// EVIL1.ORG MAIN JAVASCRIPT
// ===========================================

// Legitimacy toast functionality
document.addEventListener('DOMContentLoaded', function() {
    const toast = document.getElementById('legitimacy-toast');
    const btn = document.getElementById('legitimacy-btn');
    const verifiedBadge = document.getElementById('verified-badge');
    const closeBtn = document.querySelector('.toast-close');

    console.log('Toast elements found:', {
        toast: !!toast,
        btn: !!btn,
        verifiedBadge: !!verifiedBadge,
        closeBtn: !!closeBtn
    });

    // Function to show toast
    function showToast() {
        console.log('Showing toast');
        toast.classList.add('show');
    }

    // Function to hide toast
    function hideToast() {
        console.log('Hiding toast');
        toast.classList.remove('show');
    }

    // Button click handler
    if (btn && toast) {
        btn.addEventListener('click', showToast);
    }

    // Verified badge click handler
    if (verifiedBadge && toast) {
        verifiedBadge.addEventListener('click', showToast);
    }

    // Close button handler
    if (closeBtn) {
        closeBtn.addEventListener('click', hideToast);
    }

    // Close on outside click
    if (toast) {
        toast.addEventListener('click', function(e) {
            if (e.target === toast) {
                hideToast();
            }
        });
    }

    // Close on Escape
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && toast.classList.contains('show')) {
            hideToast();
        }
    });
});

console.log('🚀 evil1.org JavaScript loaded successfully');
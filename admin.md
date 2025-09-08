---
layout: default
title: "Content Management Interface"
author: "AI Assistant"
date: "2025-09-08"
description: "Simple web interface for creating and managing articles on evil1.org"
permalink: "/admin/content/"
---

<link rel="stylesheet" href="{{ '/assets/css/admin.css' | relative_url }}">

<div class="admin-container">
    <header class="admin-header">
        <h1>📝 Content Management</h1>
        <p>Create and manage articles for evil1.org</p>
    </header>

    <div class="admin-content">
        <div class="content-form">
            <h2>New Article</h2>
            <form id="article-form">
                <div class="form-row">
                    <div class="form-group">
                        <label for="title">Article Title *</label>
                        <input type="text" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="author">Author *</label>
                        <input type="text" id="author" name="author" value="Editorial Team" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="description">Description *</label>
                        <textarea id="description" name="description" rows="3" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="tags">Tags (comma-separated)</label>
                        <input type="text" id="tags" name="tags" placeholder="corporate-corruption, ethics, finance">
                    </div>
                </div>

                <div class="form-group">
                    <label for="content">Article Content *</label>
                    <textarea id="content" name="content" rows="20" required></textarea>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select id="category" name="category">
                            <option value="">Select Category</option>
                            <option value="corporate-corruption">Corporate Corruption</option>
                            <option value="labor-exploitation">Labor Exploitation</option>
                            <option value="financial-crime">Financial Crime</option>
                            <option value="environmental">Environmental</option>
                            <option value="political">Political</option>
                            <option value="technology">Technology</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="featured">Featured Article</label>
                        <input type="checkbox" id="featured" name="featured">
                    </div>
                </div>

                <div class="form-actions">
                    <button type="button" id="preview-btn" class="btn-secondary">Preview</button>
                    <button type="button" id="save-draft-btn" class="btn-secondary">Save Draft</button>
                    <button type="submit" id="publish-btn" class="btn-primary">Publish Article</button>
                </div>
            </form>
        </div>

        <div class="content-sidebar">
            <div class="sidebar-section">
                <h3>Recent Articles</h3>
                <div id="recent-articles">
                    <p>Loading...</p>
                </div>
            </div>

            <div class="sidebar-section">
                <h3>Quick Stats</h3>
                <div id="stats">
                    <p>Loading...</p>
                </div>
            </div>

            <div class="sidebar-section">
                <h3>Writing Tips</h3>
                <ul>
                    <li>Use clear, engaging titles</li>
                    <li>Include relevant tags for SEO</li>
                    <li>Write compelling descriptions</li>
                    <li>Use markdown formatting</li>
                    <li>Include sources when possible</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Preview Modal -->
    <div id="preview-modal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Article Preview</h3>
                <span class="modal-close">&times;</span>
            </div>
            <div class="modal-body" id="preview-content">
                <!-- Preview content will be inserted here -->
            </div>
        </div>
    </div>
</div>

<style>
.admin-container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 2rem;
}

.admin-header {
    text-align: center;
    margin-bottom: 2rem;
}

.admin-header h1 {
    color: #dc3545;
    font-size: 2.5rem;
    margin-bottom: 0.5rem;
}

.admin-content {
    display: grid;
    grid-template-columns: 1fr 300px;
    gap: 2rem;
}

.content-form {
    background: white;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.content-form h2 {
    color: #dc3545;
    margin-bottom: 1.5rem;
    border-bottom: 2px solid #dc3545;
    padding-bottom: 0.5rem;
}

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
    margin-bottom: 1rem;
}

.form-group {
    margin-bottom: 1rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 600;
    color: #333;
}

.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #ced4da;
    border-radius: 4px;
    font-size: 1rem;
}

.form-group textarea {
    resize: vertical;
    font-family: monospace;
}

.form-actions {
    display: flex;
    gap: 1rem;
    justify-content: flex-end;
    margin-top: 2rem;
    padding-top: 1rem;
    border-top: 1px solid #e9ecef;
}

.btn-primary,
.btn-secondary {
    padding: 0.75rem 2rem;
    border: none;
    border-radius: 4px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
}

.btn-primary {
    background: #dc3545;
    color: white;
}

.btn-primary:hover {
    background: #c82333;
    transform: translateY(-1px);
}

.btn-secondary {
    background: #6c757d;
    color: white;
}

.btn-secondary:hover {
    background: #5a6268;
    transform: translateY(-1px);
}

.content-sidebar {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
}

.sidebar-section {
    background: white;
    padding: 1.5rem;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.sidebar-section h3 {
    color: #dc3545;
    margin-bottom: 1rem;
    font-size: 1.2rem;
}

.sidebar-section ul {
    margin: 0;
    padding-left: 1.5rem;
}

.sidebar-section li {
    margin-bottom: 0.5rem;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
}

.modal-content {
    background-color: white;
    margin: 5% auto;
    padding: 0;
    border-radius: 8px;
    width: 90%;
    max-width: 800px;
    max-height: 80vh;
    overflow-y: auto;
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1.5rem;
    border-bottom: 1px solid #e9ecef;
}

.modal-header h3 {
    margin: 0;
    color: #dc3545;
}

.modal-close {
    font-size: 2rem;
    cursor: pointer;
    color: #6c757d;
}

.modal-close:hover {
    color: #dc3545;
}

.modal-body {
    padding: 1.5rem;
    line-height: 1.6;
}

@media (max-width: 1024px) {
    .admin-content {
        grid-template-columns: 1fr;
    }

    .form-row {
        grid-template-columns: 1fr;
    }
}
</style>

<script>
// Article management functionality
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('article-form');
    const previewBtn = document.getElementById('preview-btn');
    const saveDraftBtn = document.getElementById('save-draft-btn');
    const publishBtn = document.getElementById('publish-btn');
    const previewModal = document.getElementById('preview-modal');
    const modalClose = document.querySelector('.modal-close');

    // Load recent articles and stats
    loadRecentArticles();
    loadStats();

    // Preview functionality
    previewBtn.addEventListener('click', function() {
        const formData = new FormData(form);
        const previewContent = generatePreview(formData);
        document.getElementById('preview-content').innerHTML = previewContent;
        previewModal.style.display = 'block';
    });

    // Modal close
    modalClose.addEventListener('click', function() {
        previewModal.style.display = 'none';
    });

    window.addEventListener('click', function(event) {
        if (event.target === previewModal) {
            previewModal.style.display = 'none';
        }
    });

    // Save draft
    saveDraftBtn.addEventListener('click', function() {
        const formData = new FormData(form);
        const articleData = {
            title: formData.get('title'),
            author: formData.get('author'),
            description: formData.get('description'),
            tags: formData.get('tags'),
            category: formData.get('category'),
            content: formData.get('content'),
            featured: formData.get('featured') === 'on',
            savedAt: new Date().toISOString(),
            status: 'draft'
        };

        localStorage.setItem('article-draft', JSON.stringify(articleData));
        alert('✅ Draft saved successfully!');
    });

    // Publish article
    form.addEventListener('submit', function(e) {
        e.preventDefault();

        if (!validateForm()) {
            alert('❌ Please fill in all required fields.');
            return;
        }

        const formData = new FormData(form);
        const articleData = {
            title: formData.get('title'),
            author: formData.get('author'),
            description: formData.get('description'),
            tags: formData.get('tags'),
            category: formData.get('category'),
            content: formData.get('content'),
            featured: formData.get('featured') === 'on',
            publishedAt: new Date().toISOString(),
            status: 'published'
        };

        // Generate filename
        const filename = generateFilename(articleData.title);

        // Create markdown content
        const markdownContent = generateMarkdown(articleData);

        // In a real implementation, this would send to server
        console.log('Publishing article:', filename, markdownContent);

        alert('🚀 Article published successfully! (Note: This is a demo - actual publishing would require server-side implementation)');

        // Reset form
        form.reset();
    });

    function validateForm() {
        const requiredFields = form.querySelectorAll('[required]');
        let isValid = true;

        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                field.style.borderColor = '#dc3545';
                isValid = false;
            } else {
                field.style.borderColor = '#ced4da';
            }
        });

        return isValid;
    }

    function generatePreview(formData) {
        const title = formData.get('title') || 'Untitled';
        const author = formData.get('author') || 'Anonymous';
        const description = formData.get('description') || '';
        const content = formData.get('content') || '';
        const tags = formData.get('tags') || '';

        let html = `<h1>${title}</h1>`;
        html += `<p class="meta">By ${author} | ${new Date().toLocaleDateString()}</p>`;

        if (description) {
            html += `<p class="description">${description}</p>`;
        }

        if (tags) {
            const tagArray = tags.split(',').map(tag => tag.trim());
            html += `<div class="tags">Tags: ${tagArray.map(tag => `<span class="tag">${tag}</span>`).join('')}</div>`;
        }

        // Simple markdown-like parsing for preview
        const parsedContent = content
            .replace(/^### (.*$)/gim, '<h3>$1</h3>')
            .replace(/^## (.*$)/gim, '<h2>$1</h2>')
            .replace(/^# (.*$)/gim, '<h1>$1</h1>')
            .replace(/\*\*(.*)\*\*/gim, '<strong>$1</strong>')
            .replace(/\*(.*)\*/gim, '<em>$1</em>')
            .replace(/\n\n/g, '</p><p>')
            .replace(/\n/g, '<br>');

        html += `<div class="content"><p>${parsedContent}</p></div>`;

        return html;
    }

    function generateFilename(title) {
        return title.toLowerCase()
            .replace(/[^a-z0-9\s]/g, '')
            .replace(/\s+/g, '-')
            .replace(/-+/g, '-')
            .replace(/^-|-$/g, '');
    }

    function generateMarkdown(articleData) {
        const frontMatter = `---
layout: article
title: "${articleData.title}"
author: "${articleData.author}"
date: "${new Date().toISOString().split('T')[0]}"
description: "${articleData.description}"
tags: [${articleData.tags ? articleData.tags.split(',').map(tag => `"${tag.trim()}"`).join(', ') : ''}]
${articleData.category ? `categories: ["${articleData.category}"]` : ''}
${articleData.featured ? 'featured: true' : ''}
published: true
---

# ${articleData.title}

${articleData.content}
`;

        return frontMatter;
    }

    function loadRecentArticles() {
        // In a real implementation, this would fetch from server
        const recentArticles = [
            { title: 'Corporate Espionage Tactics', date: '2025-09-07' },
            { title: 'Executive Compensation Scandals', date: '2025-09-06' },
            { title: 'Supply Chain Exploitation', date: '2025-09-05' }
        ];

        const html = recentArticles.map(article =>
            `<div class="recent-article">
                <h4>${article.title}</h4>
                <p>${article.date}</p>
            </div>`
        ).join('');

        document.getElementById('recent-articles').innerHTML = html;
    }

    function loadStats() {
        // Mock stats - in real implementation, fetch from analytics
        const stats = {
            totalArticles: 38,
            publishedThisMonth: 5,
            totalViews: 15420,
            avgReadingTime: '8 min'
        };

        const html = `
            <div class="stat-item">
                <span class="stat-label">Total Articles:</span>
                <span class="stat-value">${stats.totalArticles}</span>
            </div>
            <div class="stat-item">
                <span class="stat-label">Published This Month:</span>
                <span class="stat-value">${stats.publishedThisMonth}</span>
            </div>
            <div class="stat-item">
                <span class="stat-label">Total Views:</span>
                <span class="stat-value">${stats.totalViews.toLocaleString()}</span>
            </div>
            <div class="stat-item">
                <span class="stat-label">Avg Reading Time:</span>
                <span class="stat-value">${stats.avgReadingTime}</span>
            </div>
        `;

        document.getElementById('stats').innerHTML = html;
    }

    // Load draft if exists
    const savedDraft = localStorage.getItem('article-draft');
    if (savedDraft) {
        const draft = JSON.parse(savedDraft);
        Object.keys(draft).forEach(key => {
            const field = form.querySelector(`[name="${key}"]`);
            if (field) {
                if (field.type === 'checkbox') {
                    field.checked = draft[key];
                } else {
                    field.value = draft[key];
                }
            }
        });
    }
});
</script>

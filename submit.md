---
layout: default
title: Submit Your Story, Job, or Soul Contract
description: Submit your story, job offer, or soul contract to evil1.org
permalink: /submit/
---

<script src="https://unpkg.com/htmx.org@1.9.10"></script>

<div class="container evil-form">
    <h2>Submit Your Story, Job, or Soul Contract</h2>
    <form action="https://formspree.io/f/xknkqgqv" method="POST">
        <label for="type">Type</label>
        <select id="type" name="type" required>
            <option value="story">Story</option>
            <option value="job">Job Offer</option>
            <option value="contract">Soul Contract</option>
        </select>
        <label for="title">Title</label>
        <input type="text" id="title" name="title" required>
        <label for="description">Description</label>
        <textarea id="description" name="description" required></textarea>
        <label for="contact">Contact Email</label>
        <input type="email" id="contact" name="contact" required>
        <div class="actions">
            <button type="submit">Submit</button>
        </div>
        <div id="form-message" class="form-message"></div>
    </form>
</div>

---
layout: default
title: Register Your Soul
description: Register your soul with evil1.org
permalink: /register/
---

<script src="https://unpkg.com/htmx.org@1.9.10"></script>

<div class="container evil-form">
    <h2>Register Your Soul</h2>
    <form action="https://formspree.io/f/xknkqgqv" method="POST">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
        <div class="actions">
            <button type="submit">Register</button>
        </div>
        <div id="form-message" class="form-message"></div>
    </form>
</div>

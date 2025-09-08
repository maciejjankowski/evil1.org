---
layout: default
title: Login
description: Login to evil1.org
permalink: /login/
---

<script src="https://unpkg.com/htmx.org@1.9.10"></script>

<div class="container evil-form">
    <h2>Login</h2>
    <form action="https://formspree.io/f/xknkqgqv" method="POST">
        <label for="username">Username or Email</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
        <div class="actions">
            <button type="submit">Sign In</button>
        </div>
        <div id="form-message" class="form-message"></div>
    </form>
</div>

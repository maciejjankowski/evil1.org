---
layout: coming-soon
title: "The Unveiling of Corporate Evil"
description: "The truth is coming. Subscribe to be the first to know."
---

<div class="container mx-auto px-4 text-center">
    <h1 class="text-4xl font-bold mb-4">Something Wicked This Way Comes</h1>
    <p class="text-lg mb-8">We are pulling back the curtain on the corporate malfeasance that shapes our world. The stories you were never meant to hear are coming.</p>

    <div id="countdown" class="text-2xl font-mono mb-8"></div>

    <h2 class="text-2xl font-bold mb-4">What We're Exposing:</h2>
    <ul class="list-none p-0 mb-8">
        <li class="p-2">The Amazon Union-Busting Playbook</li>
        <li class="p-2">Big Pharma's Price-Fixing Cartels</li>
        <li class="p-2">Wall Street's Synthetic Financial Weapons</li>
        <li class="p-2">The Right to Repair, and Who's Killing It</li>
        <li class="p-2 text-gray-500">...and so much more.</li>
    </ul>

    <h2 class="text-2xl font-bold mb-4">Don't Miss The Unveiling</h2>
    <p class="mb-4">Subscribe now to get exclusive early access and be the first to know when we go live.</p>

    <form action="YOUR_NEWSLETTER_FORM_ACTION" method="post" class="flex justify-center">
        <input type="email" name="email" placeholder="Your Email Address" class="p-2 border rounded-l-md w-64">
        <button type="submit" class="bg-red-600 text-white p-2 rounded-r-md">Subscribe</button>
    </form>
</div>

<script>
// Set the date we're counting down to
var countDownDate = new Date("Oct 31, 2025 00:00:00").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="countdown"
  document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("countdown").innerHTML = "LAUNCHED";
  }
}, 1000);
</script>

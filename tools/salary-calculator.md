---
layout: default
title: "Executive Salary vs Worker Pay Calculator"
description: "Calculate and visualize the obscene gap between CEO compensation and worker wages"
permalink: /tools/salary-calculator/
---

<div class="early-section">
    <div class="early-section-header">Executive Salary vs Worker Pay Calculator</div>
    <div class="early-section-content">
        <p>Discover just how obscene the gap has become between executive compensation and worker wages. Input real data or use our presets based on actual companies.</p>
        
        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin: 20px 0;">
            <div>
                <h3>👔 Executive Compensation</h3>
                <div style="margin-bottom: 15px;">
                    <label for="ceo-salary" style="display: block; margin-bottom: 5px; font-weight: bold;">Annual CEO Compensation ($):</label>
                    <input type="number" id="ceo-salary" value="15000000" onchange="calculateRatio()" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                </div>
                
                <div style="margin-bottom: 15px;">
                    <label for="company-preset" style="display: block; margin-bottom: 5px; font-weight: bold;">Or Choose a Real Company:</label>
                    <select id="company-preset" onchange="loadPreset()" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                        <option value="">Custom</option>
                        <option value="walmart">Walmart</option>
                        <option value="amazon">Amazon</option>
                        <option value="disney">Disney</option>
                        <option value="tesla">Tesla</option>
                        <option value="apple">Apple</option>
                        <option value="meta">Meta</option>
                        <option value="google">Google</option>
                    </select>
                </div>
            </div>
            
            <div>
                <h3>👷 Worker Compensation</h3>
                <div style="margin-bottom: 15px;">
                    <label for="worker-salary" style="display: block; margin-bottom: 5px; font-weight: bold;">Annual Worker Salary ($):</label>
                    <input type="number" id="worker-salary" value="35000" onchange="calculateRatio()" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                </div>
                
                <div style="margin-bottom: 15px;">
                    <label for="hours-per-week" style="display: block; margin-bottom: 5px; font-weight: bold;">Hours per Week:</label>
                    <input type="number" id="hours-per-week" value="40" onchange="calculateRatio()" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                </div>
            </div>
        </div>
        
        <div id="results" style="background: #f8f9fa; border: 1px solid #dee2e6; border-radius: 8px; padding: 20px; margin: 20px 0;">
            <!-- Results will be displayed here -->
        </div>
        
        <div style="text-align: center; margin-top: 15px;">
            <button onclick="shareResults()" style="background: #1DA1F2; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer;">Share These Results</button>
        </div>
    </div>
</div>

<div class="early-section">
    <div class="early-section-header">The Reality of Income Inequality</div>
    <div class="early-section-content">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
            <div class="early-article">
                <div class="early-article-header">
                    <div class="early-article-title">📈 Historical Context</div>
                </div>
                <div class="early-article-content">
                    <p>In 1965, the CEO-to-worker pay ratio was 21:1. By 2021, it had exploded to 399:1 at S&P 500 companies.</p>
                </div>
            </div>
            
            <div class="early-article">
                <div class="early-article-header">
                    <div class="early-article-title">🌍 Global Perspective</div>
                </div>
                <div class="early-article-content">
                    <p>US CEO pay ratios are 5-10x higher than other developed countries. German CEOs make 50:1 compared to workers.</p>
                </div>
            </div>
            
            <div class="early-article">
                <div class="early-article-header">
                    <div class="early-article-title">💰 The Real Numbers</div>
                </div>
                <div class="early-article-content">
                    <p>Some CEOs make more in a day than their median worker makes in a year. The system is fundamentally broken.</p>
                </div>
            </div>
        </div>
        
        <div style="background: #fff3cd; border: 1px solid #ffeaa7; padding: 15px; border-radius: 4px; margin: 20px 0;">
            <strong>💡 Why This Matters:</strong> Extreme inequality undermines democracy, reduces economic mobility, and concentrates power in the hands of a few ultra-wealthy individuals.
        </div>
    </div>
</div>

<script>
const companyData = {
    walmart: {
        ceo: 25700000,
        worker: 25000,
        name: "Walmart"
    },
    amazon: {
        ceo: 212701169,
        worker: 29007,
        name: "Amazon"
    },
    disney: {
        ceo: 32461836,
        worker: 52184,
        name: "Disney"
    },
    tesla: {
        ceo: 23500000000,
        worker: 47000,
        name: "Tesla"
    },
    apple: {
        ceo: 98734394,
        worker: 68254,
        name: "Apple"
    },
    meta: {
        ceo: 24435685,
        worker: 296267,
        name: "Meta"
    },
    google: {
        ceo: 6832292,
        worker: 279802,
        name: "Google (Alphabet)"
    }
};

function loadPreset() {
    const preset = document.getElementById('company-preset').value;
    if (preset && companyData[preset]) {
        document.getElementById('ceo-salary').value = companyData[preset].ceo;
        document.getElementById('worker-salary').value = companyData[preset].worker;
        calculateRatio();
    }
}

function calculateRatio() {
    const ceoSalary = parseFloat(document.getElementById('ceo-salary').value) || 0;
    const workerSalary = parseFloat(document.getElementById('worker-salary').value) || 0;
    const hoursPerWeek = parseFloat(document.getElementById('hours-per-week').value) || 40;
    
    if (ceoSalary === 0 || workerSalary === 0) return;
    
    const ratio = ceoSalary / workerSalary;
    const workerHourlyWage = workerSalary / (52 * hoursPerWeek);
    const ceoHourlyWage = ceoSalary / (52 * 40); // Assume CEO works 40 hours/week
    const ceoMinuteWage = ceoHourlyWage / 60;
    const minutesToEarnWorkerSalary = workerSalary / ceoMinuteWage;
    
    const daysToEarnWorkerSalary = minutesToEarnWorkerSalary / (8 * 60); // 8-hour workday
    const hoursToEarnWorkerSalary = minutesToEarnWorkerSalary / 60;
    
    const resultsHTML = `
        <div style="text-align: center; margin-bottom: 30px;">
            <div style="font-size: 48px; font-weight: bold; color: #dc3545; margin-bottom: 10px;">
                ${Math.round(ratio)}:1
            </div>
            <div style="font-size: 18px; color: #666;">
                CEO-to-Worker Pay Ratio
            </div>
        </div>
        
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin: 20px 0;">
            <div style="background: white; padding: 15px; border-radius: 8px; text-align: center; border: 1px solid #dee2e6;">
                <div style="font-size: 24px; font-weight: bold; color: #28a745;">$${workerHourlyWage.toFixed(2)}</div>
                <div style="color: #666; font-size: 14px;">Worker Hourly Wage</div>
            </div>
            
            <div style="background: white; padding: 15px; border-radius: 8px; text-align: center; border: 1px solid #dee2e6;">
                <div style="font-size: 24px; font-weight: bold; color: #dc3545;">$${ceoHourlyWage.toLocaleString()}</div>
                <div style="color: #666; font-size: 14px;">CEO Hourly Wage</div>
            </div>
            
            <div style="background: white; padding: 15px; border-radius: 8px; text-align: center; border: 1px solid #dee2e6;">
                <div style="font-size: 24px; font-weight: bold; color: #fd7e14;">$${ceoMinuteWage.toFixed(0)}</div>
                <div style="color: #666; font-size: 14px;">CEO Per Minute</div>
            </div>
        </div>
        
        <div style="background: #f8d7da; border: 1px solid #f5c6cb; border-radius: 8px; padding: 20px; margin: 20px 0; text-align: center;">
            <div style="font-size: 20px; font-weight: bold; margin-bottom: 10px;">
                ⏱️ Time for CEO to Earn Worker's Annual Salary
            </div>
            <div style="font-size: 32px; font-weight: bold; color: #721c24;">
                ${daysToEarnWorkerSalary < 1 ? 
                    `${hoursToEarnWorkerSalary.toFixed(1)} hours` : 
                    `${daysToEarnWorkerSalary.toFixed(1)} days`
                }
            </div>
        </div>
        
        <div style="background: #d1ecf1; border: 1px solid #bee5eb; border-radius: 8px; padding: 15px; margin: 20px 0;">
            <strong>Reality Check:</strong> While a worker labors for an entire year, the CEO earns the same amount in ${daysToEarnWorkerSalary < 1 ? 'less than a day' : `just ${daysToEarnWorkerSalary.toFixed(1)} days`}. This level of inequality is unprecedented in human history.
        </div>
    `;
    
    document.getElementById('results').innerHTML = resultsHTML;
}

function shareResults() {
    const ceoSalary = parseFloat(document.getElementById('ceo-salary').value) || 0;
    const workerSalary = parseFloat(document.getElementById('worker-salary').value) || 0;
    const ratio = Math.round(ceoSalary / workerSalary);
    
    const preset = document.getElementById('company-preset').value;
    const companyName = preset ? companyData[preset].name : 'this company';
    
    const tweetText = `At ${companyName}, the CEO-to-worker pay ratio is ${ratio}:1. Check your company's inequality at evil1.org! #PayGap #IncomeInequality #CorporateGreed`;
    const tweetUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(tweetText)}&url=${encodeURIComponent(window.location.href)}`;
    window.open(tweetUrl, '_blank');
}

// Calculate initial ratio on page load
document.addEventListener('DOMContentLoaded', calculateRatio);
</script>
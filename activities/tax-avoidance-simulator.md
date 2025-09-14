---
layout: default
title: "Tax Avoidance Simulator - Corporate Tax Dodging Masterclass"
description: "Interactive simulator showing how corporations legally steal from society through tax avoidance schemes."
permalink: /activities/tax-avoidance-simulator/
---

<div class="early-section">
    <div class="early-section-header">💸 Corporate Tax Avoidance Simulator</div>
    <div class="early-section-content">
        <div style="text-align: center; margin-bottom: 30px; padding: 20px; background: #FFF8E1; border: 1px solid #FFE082; border-radius: 8px;">
            <h3 style="color: #E65100; margin-bottom: 15px;">⚠️ Educational Tax Dodging Ahead</h3>
            <p style="margin-bottom: 10px;"><strong>Learn the EXACT methods corporations use to avoid billions in taxes.</strong></p>
            <p style="font-size: 14px; color: #E65100;">These are real schemes used by major corporations to shift the tax burden to working people.</p>
        </div>

        <!-- Corporate Tax Dodging Game -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">🏢 Build Your Tax Avoidance Empire</div>
            <div class="early-section-content">
                <div id="tax-simulator" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>EvilCorp Tax Optimization Dashboard</h4>
                    
                    <!-- Company Stats -->
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 15px; margin: 20px 0;">
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #4CAF50;">
                            <div style="font-size: 24px; font-weight: bold; color: #2E7D32;" id="company-profit">$1B</div>
                            <div style="font-size: 12px; color: #666;">Annual Profit</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #F44336;">
                            <div style="font-size: 24px; font-weight: bold; color: #C62828;" id="taxes-owed">$210M</div>
                            <div style="font-size: 12px; color: #666;">Taxes Owed (21%)</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #FF9800;">
                            <div style="font-size: 24px; font-weight: bold; color: #E65100;" id="taxes-paid">$210M</div>
                            <div style="font-size: 12px; color: #666;">Taxes Actually Paid</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #9C27B0;">
                            <div style="font-size: 24px; font-weight: bold; color: #7B1FA2;" id="effective-rate">21.0%</div>
                            <div style="font-size: 12px; color: #666;">Effective Tax Rate</div>
                        </div>
                    </div>

                    <!-- Tax Avoidance Schemes -->
                    <h5 style="margin-top: 30px;">🎭 Select Your Tax Avoidance Schemes</h5>
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 15px; margin: 20px 0;">
                        
                        <!-- Ireland Double Dutch -->
                        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
                            <input type="checkbox" onchange="updateTaxes()" data-savings="60000000" data-complexity="high" data-risk="low" style="margin-right: 10px; margin-top: 5px;">
                            <div style="flex: 1;">
                                <div style="font-weight: bold; color: #2E7D32;">🇮🇪 Ireland Double Dutch Sandwich</div>
                                <div style="font-size: 12px; color: #666; margin: 5px 0;">Route profits through Ireland and Netherlands to avoid $60M in taxes</div>
                                <div style="font-size: 11px; background: #E8F5E8; padding: 5px; border-radius: 3px;">
                                    <strong>Complexity:</strong> High • <strong>Risk:</strong> Low • <strong>Legality:</strong> 100%
                                </div>
                            </div>
                        </label>

                        <!-- Bermuda Triangle -->
                        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
                            <input type="checkbox" onchange="updateTaxes()" data-savings="80000000" data-complexity="high" data-risk="low" style="margin-right: 10px; margin-top: 5px;">
                            <div style="flex: 1;">
                                <div style="font-weight: bold; color: #2E7D32;">🏝️ Bermuda Triangle Structure</div>
                                <div style="font-size: 12px; color: #666; margin: 5px 0;">Move intellectual property to Bermuda (0% corporate tax) to save $80M</div>
                                <div style="font-size: 11px; background: #E8F5E8; padding: 5px; border-radius: 3px;">
                                    <strong>Complexity:</strong> High • <strong>Risk:</strong> Low • <strong>Legality:</strong> 100%
                                </div>
                            </div>
                        </label>

                        <!-- Luxembourg Leaks -->
                        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
                            <input type="checkbox" onchange="updateTaxes()" data-savings="45000000" data-complexity="medium" data-risk="low" style="margin-right: 10px; margin-top: 5px;">
                            <div style="flex: 1;">
                                <div style="font-weight: bold; color: #2E7D32;">🇱🇺 Luxembourg Ruling Special</div>
                                <div style="font-size: 12px; color: #666; margin: 5px 0;">Negotiate secret tax ruling for 2% effective rate, save $45M</div>
                                <div style="font-size: 11px; background: #E8F5E8; padding: 5px; border-radius: 3px;">
                                    <strong>Complexity:</strong> Medium • <strong>Risk:</strong> Low • <strong>Legality:</strong> 100%
                                </div>
                            </div>
                        </label>

                        <!-- Transfer Pricing -->
                        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
                            <input type="checkbox" onchange="updateTaxes()" data-savings="35000000" data-complexity="medium" data-risk="medium" style="margin-right: 10px; margin-top: 5px;">
                            <div style="flex: 1;">
                                <div style="font-weight: bold; color: #FF9800;">🔄 Transfer Pricing Magic</div>
                                <div style="font-size: 12px; color: #666; margin: 5px 0;">Charge subsidiaries inflated prices to shift profits to low-tax countries</div>
                                <div style="font-size: 11px; background: #FFF3E0; padding: 5px; border-radius: 3px;">
                                    <strong>Complexity:</strong> Medium • <strong>Risk:</strong> Medium • <strong>Legality:</strong> Gray area
                                </div>
                            </div>
                        </label>

                        <!-- Debt Loading -->
                        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
                            <input type="checkbox" onchange="updateTaxes()" data-savings="25000000" data-complexity="low" data-risk="low" style="margin-right: 10px; margin-top: 5px;">
                            <div style="flex: 1;">
                                <div style="font-weight: bold; color: #2E7D32;">💳 Debt Loading Scheme</div>
                                <div style="font-size: 12px; color: #666; margin: 5px 0;">Load US operations with debt to create tax-deductible interest payments</div>
                                <div style="font-size: 11px; background: #E8F5E8; padding: 5px; border-radius: 3px;">
                                    <strong>Complexity:</strong> Low • <strong>Risk:</strong> Low • <strong>Legality:</strong> 100%
                                </div>
                            </div>
                        </label>

                        <!-- Stock Options -->
                        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
                            <input type="checkbox" onchange="updateTaxes()" data-savings="15000000" data-complexity="low" data-risk="low" style="margin-right: 10px; margin-top: 5px;">
                            <div style="flex: 1;">
                                <div style="font-weight: bold; color: #2E7D32;">📈 Executive Stock Option Loophole</div>
                                <div style="font-size: 12px; color: #666; margin: 5px 0;">Deduct executive stock options at inflated values for massive tax breaks</div>
                                <div style="font-size: 11px; background: #E8F5E8; padding: 5px; border-radius: 3px;">
                                    <strong>Complexity:</strong> Low • <strong>Risk:</strong> Low • <strong>Legality:</strong> 100%
                                </div>
                            </div>
                        </label>

                        <!-- R&D Credit Abuse -->
                        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
                            <input type="checkbox" onchange="updateTaxes()" data-savings="20000000" data-complexity="medium" data-risk="low" style="margin-right: 10px; margin-top: 5px;">
                            <div style="flex: 1;">
                                <div style="font-weight: bold; color: #2E7D32;">🧪 R&D Credit Manipulation</div>
                                <div style="font-size: 12px; color: #666; margin: 5px 0;">Classify regular business activities as "research" for tax credits</div>
                                <div style="font-size: 11px; background: #E8F5E8; padding: 5px; border-radius: 3px;">
                                    <strong>Complexity:</strong> Medium • <strong>Risk:</strong> Low • <strong>Legality:</strong> 100%
                                </div>
                            </div>
                        </label>

                        <!-- Accelerated Depreciation -->
                        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
                            <input type="checkbox" onchange="updateTaxes()" data-savings="30000000" data-complexity="low" data-risk="low" style="margin-right: 10px; margin-top: 5px;">
                            <div style="flex: 1;">
                                <div style="font-weight: bold; color: #2E7D32;">⚡ Accelerated Depreciation Abuse</div>
                                <div style="font-size: 12px; color: #666; margin: 5px 0;">Write off equipment purchases immediately instead of over time</div>
                                <div style="font-size: 11px; background: #E8F5E8; padding: 5px; border-radius: 3px;">
                                    <strong>Complexity:</strong> Low • <strong>Risk:</strong> Low • <strong>Legality:</strong> 100%
                                </div>
                            </div>
                        </label>

                    </div>

                    <!-- Results Display -->
                    <div id="tax-results" style="margin-top: 30px; padding: 20px; background: white; border-radius: 8px; border: 1px solid #DDD;">
                        <h5 style="margin-top: 0;">📊 Your Tax Avoidance Results</h5>
                        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px;">
                            <div>
                                <div style="font-size: 14px; color: #666;">Total Tax Savings</div>
                                <div style="font-size: 32px; font-weight: bold; color: #4CAF50;" id="total-savings">$0</div>
                            </div>
                            <div>
                                <div style="font-size: 14px; color: #666;">New Effective Rate</div>
                                <div style="font-size: 32px; font-weight: bold; color: #E91E63;" id="new-rate">21.0%</div>
                            </div>
                            <div>
                                <div style="font-size: 14px; color: #666;">Schools/Hospitals Unfunded</div>
                                <div style="font-size: 24px; font-weight: bold; color: #F44336;" id="social-impact">0</div>
                            </div>
                        </div>
                        
                        <div id="scheme-details" style="margin-top: 20px; padding: 15px; background: #FFF3E0; border-radius: 4px; display: none;">
                            <h6 style="margin-top: 0; color: #E65100;">💡 Your Tax Avoidance Strategy</h6>
                            <div id="strategy-explanation" style="font-size: 14px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Real Corporation Examples -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">🏆 Corporate Tax Dodging Hall of Fame</div>
            <div class="early-section-content">
                <p><strong>See how real corporations use these exact schemes!</strong></p>
                
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin: 20px 0;">
                    
                    <!-- Apple -->
                    <div style="border: 1px solid #DDD; border-radius: 8px; padding: 20px; background: white;">
                        <div style="display: flex; align-items: center; margin-bottom: 15px;">
                            <div style="font-size: 32px; margin-right: 15px;">🍎</div>
                            <div>
                                <h5 style="margin: 0; color: #333;">Apple Inc.</h5>
                                <div style="font-size: 12px; color: #666;">Master of the Irish Double Dutch</div>
                            </div>
                        </div>
                        
                        <div style="background: #F8F9FA; padding: 15px; border-radius: 4px; margin-bottom: 15px;">
                            <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                                <span style="font-size: 12px;">2019 Global Profit:</span>
                                <span style="font-weight: bold;">$84.3B</span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                                <span style="font-size: 12px;">Taxes Paid:</span>
                                <span style="font-weight: bold;">$4.4B</span>
                            </div>
                            <div style="display: flex; justify-content: space-between; border-top: 1px solid #DDD; padding-top: 5px;">
                                <span style="font-size: 12px; font-weight: bold;">Effective Tax Rate:</span>
                                <span style="font-weight: bold; color: #E91E63;">5.2%</span>
                            </div>
                        </div>
                        
                        <div style="font-size: 12px; color: #666;">
                            <strong>Method:</strong> Routes profits through Irish subsidiaries that are tax-resident nowhere. Saved approximately $15.8B in taxes in 2019 alone.
                        </div>
                    </div>

                    <!-- Amazon -->
                    <div style="border: 1px solid #DDD; border-radius: 8px; padding: 20px; background: white;">
                        <div style="display: flex; align-items: center; margin-bottom: 15px;">
                            <div style="font-size: 32px; margin-right: 15px;">📦</div>
                            <div>
                                <h5 style="margin: 0; color: #333;">Amazon</h5>
                                <div style="font-size: 12px; color: #666;">Luxembourg & Transfer Pricing Pro</div>
                            </div>
                        </div>
                        
                        <div style="background: #F8F9FA; padding: 15px; border-radius: 4px; margin-bottom: 15px;">
                            <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                                <span style="font-size: 12px;">2018 US Profit:</span>
                                <span style="font-weight: bold;">$11.2B</span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                                <span style="font-size: 12px;">Federal Taxes Paid:</span>
                                <span style="font-weight: bold;">$0</span>
                            </div>
                            <div style="display: flex; justify-content: space-between; border-top: 1px solid #DDD; padding-top: 5px;">
                                <span style="font-size: 12px; font-weight: bold;">Effective Tax Rate:</span>
                                <span style="font-weight: bold; color: #E91E63;">0%</span>
                            </div>
                        </div>
                        
                        <div style="font-size: 12px; color: #666;">
                            <strong>Method:</strong> Massive R&D credits, accelerated depreciation, and stock option deductions. Actually received $129M tax rebate.
                        </div>
                    </div>

                    <!-- General Electric -->
                    <div style="border: 1px solid #DDD; border-radius: 8px; padding: 20px; background: white;">
                        <div style="display: flex; align-items: center; margin-bottom: 15px;">
                            <div style="font-size: 32px; margin-right: 15px;">⚡</div>
                            <div>
                                <h5 style="margin: 0; color: #333;">General Electric</h5>
                                <div style="font-size: 12px; color: #666;">Multi-National Profit Shifting</div>
                            </div>
                        </div>
                        
                        <div style="background: #F8F9FA; padding: 15px; border-radius: 4px; margin-bottom: 15px;">
                            <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                                <span style="font-size: 12px;">2010 Global Profit:</span>
                                <span style="font-weight: bold;">$14.2B</span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                                <span style="font-size: 12px;">US Taxes Paid:</span>
                                <span style="font-weight: bold;">$0</span>
                            </div>
                            <div style="display: flex; justify-content: space-between; border-top: 1px solid #DDD; padding-top: 5px;">
                                <span style="font-size: 12px; font-weight: bold;">Tax Benefit Claimed:</span>
                                <span style="font-weight: bold; color: #4CAF50;">$3.2B</span>
                            </div>
                        </div>
                        
                        <div style="font-size: 12px; color: #666;">
                            <strong>Method:</strong> Complex web of offshore subsidiaries and aggressive tax credits. Received $3.2B in tax benefits while paying zero.
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Societal Impact Calculator -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">🏫 What Your Tax Dodging Actually Costs Society</div>
            <div class="early-section-content">
                <div id="impact-calculator" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>Society Impact Calculator</h4>
                    <p style="font-size: 14px; color: #666; margin-bottom: 20px;">See what your tax avoidance could have funded instead:</p>
                    
                    <div style="margin: 20px 0;">
                        <label style="display: block; margin-bottom: 10px;">Enter tax savings amount:</label>
                        <input type="number" id="savings-input" value="100000000" min="1000000" step="1000000" 
                               placeholder="Enter amount..." onchange="calculateSocialImpact()"
                               style="width: 100%; padding: 8px; border: 1px solid #DDD; border-radius: 4px;">
                    </div>
                    
                    <div id="social-calculations" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin: 20px 0;">
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #F44336;">
                            <div style="font-size: 24px; font-weight: bold; color: #D32F2F;" id="teachers">1,250</div>
                            <div style="font-size: 12px; color: #666;">Teacher Salaries (1 year)</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #2196F3;">
                            <div style="font-size: 24px; font-weight: bold; color: #1976D2;" id="schools">10</div>
                            <div style="font-size: 12px; color: #666;">New Elementary Schools</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #4CAF50;">
                            <div style="font-size: 24px; font-weight: bold; color: #2E7D32;" id="hospitals">4</div>
                            <div style="font-size: 12px; color: #666;">Community Health Centers</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #FF9800;">
                            <div style="font-size: 24px; font-weight: bold; color: #E65100;" id="bridges">500</div>
                            <div style="font-size: 12px; color: #666;">Bridge Repairs</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #9C27B0;">
                            <div style="font-size: 24px; font-weight: bold; color: #7B1FA2;" id="research">200</div>
                            <div style="font-size: 12px; color: #666;">Research Grants</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px; border-left: 4px solid #607D8B;">
                            <div style="font-size: 24px; font-weight: bold; color: #455A64;" id="families">16,667</div>
                            <div style="font-size: 12px; color: #666;">Families Lifted from Poverty</div>
                        </div>
                    </div>
                    
                    <div style="background: #FFEBEE; padding: 15px; border-radius: 4px; margin-top: 20px;">
                        <h6 style="color: #D32F2F; margin-top: 0;">💔 The Human Cost</h6>
                        <p style="margin-bottom: 0; font-size: 14px;">Every dollar in tax avoidance is a dollar not invested in education, healthcare, infrastructure, or poverty reduction. Corporate tax dodging directly harms society's most vulnerable members.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Call to Action -->
        <div class="early-section" style="margin-top: 40px;">
            <div class="early-section-header">Stop Corporate Tax Theft</div>
            <div class="early-section-content">
                <div style="text-align: center; padding: 30px; background: #E8F4F8; border-radius: 8px;">
                    <h3 style="color: #003366; margin-bottom: 15px;">You've Seen How They Steal</h3>
                    <p style="margin-bottom: 20px;">Corporate tax avoidance isn't a clever loophole - it's legalized theft from public services. Every avoided tax dollar is stolen from schools, hospitals, and infrastructure.</p>
                    
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-top: 20px;">
                        <a href="/articles/corporate-tax-evasion-stealing-from-society/" class="early-nav-link" style="background: #003366; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Read Tax Exposés</a>
                        <a href="/education/" class="early-nav-link" style="background: #4477AA; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Learn Solutions</a>
                        <a href="/membership/" class="early-nav-link" style="background: #6699CC; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Fund Research</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// Tax calculation logic
let baseProfitB = 1; // $1 billion
let baseTaxRate = 0.21; // 21%
let baseTaxOwed = baseProfitB * 1000000000 * baseTaxRate; // $210M

function updateTaxes() {
    const checkboxes = document.querySelectorAll('#tax-simulator input[type="checkbox"]:checked');
    let totalSavings = 0;
    let schemes = [];
    
    checkboxes.forEach(checkbox => {
        const savings = parseInt(checkbox.dataset.savings) || 0;
        totalSavings += savings;
        
        // Get scheme name from label
        const label = checkbox.closest('label');
        const schemeName = label.querySelector('div[style*="font-weight: bold"]').textContent;
        schemes.push(schemeName);
    });
    
    const newTaxPaid = Math.max(0, baseTaxOwed - totalSavings);
    const effectiveRate = (newTaxPaid / (baseProfitB * 1000000000)) * 100;
    
    // Update display
    document.getElementById('taxes-paid').textContent = `$${Math.round(newTaxPaid / 1000000)}M`;
    document.getElementById('effective-rate').textContent = `${effectiveRate.toFixed(1)}%`;
    document.getElementById('total-savings').textContent = `$${Math.round(totalSavings / 1000000)}M`;
    document.getElementById('new-rate').textContent = `${effectiveRate.toFixed(1)}%`;
    
    // Calculate social impact
    const schoolsDefunded = Math.round(totalSavings / 10000000); // $10M per school
    const hospitalsDefunded = Math.round(totalSavings / 25000000); // $25M per hospital
    document.getElementById('social-impact').textContent = `${schoolsDefunded + hospitalsDefunded}`;
    
    // Show scheme details
    const detailsDiv = document.getElementById('scheme-details');
    const explanationDiv = document.getElementById('strategy-explanation');
    
    if (schemes.length > 0) {
        detailsDiv.style.display = 'block';
        explanationDiv.innerHTML = `
            <p style="margin-bottom: 10px;"><strong>Active Schemes:</strong> ${schemes.join(', ')}</p>
            <p style="margin-bottom: 10px;"><strong>Tax Savings:</strong> $${(totalSavings / 1000000).toFixed(1)}M (${((totalSavings / baseTaxOwed) * 100).toFixed(1)}% reduction)</p>
            <p style="margin-bottom: 0;"><strong>Impact:</strong> Reduced effective tax rate from 21% to ${effectiveRate.toFixed(1)}%, shifting burden to working families.</p>
        `;
    } else {
        detailsDiv.style.display = 'none';
    }
    
    // Update social impact calculator
    calculateSocialImpact();
}

function calculateSocialImpact() {
    const savings = parseInt(document.getElementById('savings-input').value) || 100000000;
    
    // Based on real government spending data
    const teachers = Math.round(savings / 80000); // $80k average teacher salary
    const schools = Math.round(savings / 10000000); // $10M per elementary school
    const hospitals = Math.round(savings / 25000000); // $25M per community health center
    const bridges = Math.round(savings / 200000); // $200k per bridge repair
    const research = Math.round(savings / 500000); // $500k per research grant
    const families = Math.round(savings / 6000); // $6k to lift family from poverty line
    
    document.getElementById('teachers').textContent = teachers.toLocaleString();
    document.getElementById('schools').textContent = schools.toLocaleString();
    document.getElementById('hospitals').textContent = hospitals.toLocaleString();
    document.getElementById('bridges').textContent = bridges.toLocaleString();
    document.getElementById('research').textContent = research.toLocaleString();
    document.getElementById('families').textContent = families.toLocaleString();
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    calculateSocialImpact();
    
    // Auto-check a few schemes for demo
    setTimeout(() => {
        const firstScheme = document.querySelector('#tax-simulator input[type="checkbox"]');
        if (firstScheme) {
            firstScheme.checked = true;
            updateTaxes();
        }
    }, 1000);
});
</script>

<style>
input[type="checkbox"] {
    transform: scale(1.2);
}

label:hover {
    background: #F5F5F5 !important;
    transform: translateY(-1px);
    transition: all 0.2s ease;
    border-color: #BBB !important;
}

button:hover, select:hover, input:hover {
    opacity: 0.9;
    transform: translateY(-1px);
    transition: all 0.2s ease;
}

.early-section-header {
    font-size: 24px;
    font-weight: bold;
    color: #003366;
    margin-bottom: 15px;
    border-bottom: 2px solid #003366;
    padding-bottom: 5px;
}

#tax-results {
    animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

/* Corporation cards hover effect */
.early-section .early-section-content > div:nth-child(2) > div {
    transition: all 0.3s ease;
}

.early-section .early-section-content > div:nth-child(2) > div:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}
</style>
document.addEventListener('DOMContentLoaded', () => {
  const urlParams = new URLSearchParams(window.location.search);

  document.querySelectorAll('.pricing-experiment').forEach(experimentDiv => {
    const experimentName = experimentDiv.dataset.experimentName;
    const utmTrigger = experimentDiv.dataset.utmTrigger;
    const utmValue = urlParams.get(utmTrigger);

    const experimentData = {{ site.data.pricing_experiments | where: "experiment_name", experimentName | first | jsonify }};
    
    let variant = experimentData.variants.find(v => v.utm_value === utmValue);
    if (!variant) {
      variant = experimentData.variants[0]; // Default to first variant
    }

    experimentDiv.querySelector('.price-label').textContent = `${variant.label}: `;
    experimentDiv.querySelector('.price-value').textContent = variant.price;
    const button = experimentDiv.querySelector('.btn-subscribe');
    button.dataset.variantUtm = variant.utm_value;

    button.addEventListener('click', () => {
      console.log(`Conversion logged for experiment: ${experimentName}, variant: ${variant.utm_value}, price: ${variant.price}`);
      // In a real scenario, this would send data to an analytics service
    });
  });
});

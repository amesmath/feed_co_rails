// app/assets/javascripts/dashboard.js
document.addEventListener("DOMContentLoaded", function () {
  var ctx = document.getElementById("trafficSourcesChart").getContext("2d");
  var trafficSourcesChart = new Chart(ctx, {
    type: "bar",
    data: {
      labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
      datasets: [
        {
          label: "Website Blog",
          data: [65, 59, 80, 81, 56, 55, 40],
          backgroundColor: "rgba(54, 162, 235, 0.2)",
          borderColor: "rgba(54, 162, 235, 1)",
          borderWidth: 1,
        },
        {
          label: "Social Media",
          data: [28, 48, 40, 19, 86, 27, 90],
          backgroundColor: "rgba(75, 192, 192, 0.2)",
          borderColor: "rgba(75, 192, 192, 1)",
          borderWidth: 1,
        },
      ],
    },
    options: {
      scales: {
        y: {
          beginAtZero: true,
        },
      },
    },
  });
});

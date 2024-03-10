// Function to truncate attraction descriptions
const truncateAttractionDescription = () => {
  const descriptions = document.querySelectorAll('.attractions .description')
  if(!descriptions) return

  const maxLength = 150

  descriptions.forEach(content => {
    if(content.innerHTML.length > maxLength) {
      content.innerHTML = content.innerHTML.substring(0, maxLength) + '...'
    }
  })
}


// Function to filter attractions based on categories
const filterAttractionsByCategory = () => {
  const checkboxes = document.querySelectorAll('#category-form input[type="checkbox"]')
  if (!checkboxes) return

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
      const selectedCategories = []
      checkboxes.forEach(cb => {
        if (cb.checked) {
          selectedCategories.push(cb.value)
        }
      });

      // Send AJAX request to the server
      const xhr = new XMLHttpRequest()
      xhr.open('POST', '/attractions/filter', true)
      xhr.setRequestHeader('Content-Type', 'application/json')
      xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
          // Update the filtered results container with the response
          const attractions = JSON.parse(xhr.responseText).attractions
          document.getElementById('filteredResults').innerHTML = ''
          attractions.forEach(function(attractionHTML) {
            document.getElementById('filteredResults').innerHTML += attractionHTML
        })
      }
      }
      xhr.send(JSON.stringify({ categories: selectedCategories }))
    })
  })
}


document.addEventListener('DOMContentLoaded', () => {
  filterAttractionsByCategory()
  truncateAttractionDescription()
})
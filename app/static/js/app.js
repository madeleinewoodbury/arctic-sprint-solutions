// Function to truncate attraction descriptions
const truncateAttractionDescription = () => {
    const descriptions = document.querySelectorAll('.attractions .description')
    if (!descriptions) return

    const maxLength = 150

    descriptions.forEach(content => {
        if (content.innerHTML.length > maxLength) {
            content.innerHTML = content.innerHTML.substring(0, maxLength) + '...'
        }
    })
}

// Function to update checkboxes based on the number of available attractions
const disableCheckboxes = () => {
    const attractionsContainer = document.getElementById('filtered-results')
    if (!attractionsContainer) return
    const numAttractions = attractionsContainer.querySelectorAll('.attraction').length
    const checkboxes = document.querySelectorAll('.filter input[type="checkbox"]')
    if (numAttractions === 1) {
        checkboxes.forEach(checkbox => {
            if (!checkbox.checked) {
                checkbox.disabled = true
            }
        })
    }
}

// Function to filter attractions based on categories
const filterAttractions = () => {
    const checkboxes = document.querySelectorAll('.filter input[type="checkbox"]')
    if (!checkboxes) return

    const searchInput = document.getElementById('search_text')
    const searchText = searchInput ? searchInput.value.trim() : '';
    let filterPriority = []
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            const selectedCategories = []
            const selectedAgeGroups = []
            const selectedTags = []
            checkboxes.forEach(cb => {
                if (cb.checked && cb.name === 'categories') {
                    selectedCategories.push(cb.value)
                    if (!filterPriority.includes(cb.name)) {
                        filterPriority.push(cb.name)
                    }
                } else if (cb.checked && cb.name === 'age_groups') {
                    selectedAgeGroups.push(cb.value)
                    if (!filterPriority.includes(cb.name)) {
                        filterPriority.push(cb.name)
                    }
                } else if (cb.checked && cb.name === 'tags') {
                    selectedTags.push(cb.value)
                    if (!filterPriority.includes(cb.name)) {
                        filterPriority.push(cb.name)
                    }
                }
            })

            // Updates the filterPriority if any filter groups have been reset.
            if (selectedCategories.length === 0 && filterPriority.includes('categories')) {
                filterPriority.splice(filterPriority.indexOf('categories'), 1)
            }
            if (selectedAgeGroups.length === 0 && filterPriority.includes('age_groups')) {
                filterPriority.splice(filterPriority.indexOf('age_groups'), 1)
            }
            if (selectedTags.length === 0 && filterPriority.includes('tags')) {
                filterPriority.splice(filterPriority.indexOf('tags'), 1)
            }

            // Send AJAX request to the server
            const xhr = new XMLHttpRequest()
            xhr.open('POST', '/attractions/filter', true)
            xhr.setRequestHeader('Content-Type', 'application/json')
            xhr.onreadystatechange = function () {

                // Receive AJAX response from the server
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText)
                    const attractions = response.attractions
                    const categoryIDs = response.categoryIDs
                    const ageGroupIDs = response.ageGroupIDs
                    const tagIDs = response.tagIDs

                    // Update the filtered attractions content
                    document.getElementById('filtered-results').innerHTML = ''
                    attractions.forEach(function (attractionHTML) {
                        document.getElementById('filtered-results').innerHTML += attractionHTML
                    })

                    // Update the category filter checkboxes
                    const categoryCheckbox = document.getElementById('category-checkbox')
                    if (categoryCheckbox) {
                        const checkboxInputs = categoryCheckbox.querySelectorAll('input[type="checkbox"]')
                        updateCheckboxes(checkboxInputs, categoryIDs)
                    }
                    // Update the age group filter checkboxes
                    const ageGroupCheckbox = document.getElementById('age-group-checkbox')
                    if (ageGroupCheckbox) {
                        const checkboxInputs = ageGroupCheckbox.querySelectorAll('input[type="checkbox"]')
                        updateCheckboxes(checkboxInputs, ageGroupIDs)
                    }
                    // Update the tag filter checkboxes
                    const tagCheckbox = document.getElementById('tag-checkbox')
                    if (tagCheckbox) {
                        const checkboxInputs = tagCheckbox.querySelectorAll('input[type="checkbox"]')
                        updateCheckboxes(checkboxInputs, tagIDs)
                    }
                }
            }
            xhr.send(JSON.stringify({
                selectedCategories: selectedCategories,
                selectedAgeGroups: selectedAgeGroups,
                selectedTags: selectedTags,
                searchText: searchText,
                filterPriority: filterPriority
            }))
        })
    })
}

// Function to update the availability and count labels of given checkboxes
function updateCheckboxes(checkboxes, activeIDs) {
    checkboxes.forEach(checkbox => {
        if (activeIDs.includes(checkbox.value)) {
            checkbox.removeAttribute('disabled')
        } else {
            checkbox.setAttribute('disabled', 'disabled')
            checkbox.checked = false
        }
    })
}

document.addEventListener('DOMContentLoaded', () => {
    disableCheckboxes()
    filterAttractions()
    truncateAttractionDescription()
})

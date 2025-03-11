document.getElementById('carForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const formData = new FormData(this);
    formData.append('action', 'add');

    try {
        const response = await fetch('car-management', {
            method: 'POST',
            body: formData,
        });

        if (response.ok) {
            alert('Car added successfully!');
            location.reload(); // Reload the page to see the updated data
        } else {
            alert('Failed to add car.');
        }
    } catch (error) {
        console.error('Error:', error);
    }
});

























// document.getElementById('carForm').addEventListener('submit', function (e) {
//     e.preventDefault();
//
//     const carNumber = document.getElementById('carNumber').value;
//     const model = document.getElementById('model').value;
//     const type = document.getElementById('type').value;
//     const status = document.getElementById('status').value;
//     const pictureInput = document.getElementById('picture');
//     const picture = pictureInput.files[0] ? URL.createObjectURL(pictureInput.files[0]) : '';
//
//     // Add a new row to the table
//     const table = document.getElementById('carTable').getElementsByTagName('tbody')[0];
//     const row = table.insertRow();
//
//     row.innerHTML = `
//         <td>${carNumber}</td>
//         <td>${model}</td>
//         <td>${type}</td>
//         <td>${status}</td>
//         <td>${picture ? `<img src="${picture}" alt="Car" style="width: 50px; height: auto;">` : 'N/A'}</td>
//         <td>
//             <button class="edit">Edit</button>
//             <button class="delete">Delete</button>
//         </td>
//     `;
//
//     // Clear the form
//     document.getElementById('carForm').reset();
//
//     // Add event listeners for edit and delete buttons
//     row.querySelector('.edit').addEventListener('click', () => editRow(row));
//     row.querySelector('.delete').addEventListener('click', () => deleteRow(row));
// });
//
// function editRow(row) {
//     const cells = row.querySelectorAll('td');
//     document.getElementById('carNumber').value = cells[0].textContent;
//     document.getElementById('model').value = cells[1].textContent;
//     document.getElementById('type').value = cells[2].textContent;
//     document.getElementById('status').value = cells[3].textContent;
//     row.remove();
// }
//
// function deleteRow(row) {
//     row.remove();
// }

// Load profile content into the main content area
      function loadProfileContent() {
          const mainContent = document.getElementById('mainContent');
          const profileTemplate = document.getElementById('profileTemplate');
          const profileContent = profileTemplate.content.cloneNode(true);
          mainContent.innerHTML = '';
          mainContent.appendChild(profileContent);
      }

      // Load My Vehicles content into the main content area
      function loadMyVehiclesContent() {
          const mainContent = document.getElementById('mainContent');
          const myVehiclesTemplate = document.getElementById('myVehiclesTemplate');
          const myVehiclesContent = myVehiclesTemplate.content.cloneNode(true);
          mainContent.innerHTML = '';
          mainContent.appendChild(myVehiclesContent);
      }

      // Toggle password visibility
      function togglePasswordVisibility(inputId) {
          const passwordInput = document.getElementById(inputId);
          const toggleIcon = passwordInput.nextElementSibling;
          if (passwordInput.type === 'password') {
              passwordInput.type = 'text';
              toggleIcon.classList.replace('fa-eye', 'fa-eye-slash');
          } else {
              passwordInput.type = 'password';
              toggleIcon.classList.replace('fa-eye-slash', 'fa-eye');
          }
      }

      // Save profile changes
      

      // Add a new vehicle
      function addVehicle(event) {
          event.preventDefault();
          const form = event.target;
          const formData = new FormData(form);

          // Perform save logic (e.g., send data to server)
          fetch(form.action, {
              method: 'POST',
              body: formData
          }).then(response => {
              if (response.ok) {
                  alert('Vehicle added successfully!');
                  // Close the modal
                  bootstrap.Modal.getInstance(document.getElementById('addVehicleModal')).hide();
                  // Clear the form
                  form.reset();
              } else {
                  alert('Failed to add vehicle.');
              }
          }).catch(error => {
              console.error('Error:', error);
          });
      }

      // Load Inquiries content into the main content area
      function loadInquiriesContent() {
          const mainContent = document.getElementById('mainContent');
          const inquiriesTemplate = document.getElementById('inquiriesTemplate');
          const inquiriesContent = inquiriesTemplate.content.cloneNode(true);
          mainContent.innerHTML = '';
          mainContent.appendChild(inquiriesContent);
      }

       // Load History content into the main content area
       function loadHistoryContent() {
          const mainContent = document.getElementById('mainContent');
          const inquiriesTemplate = document.getElementById('historyTemplate');
          const inquiriesContent = inquiriesTemplate.content.cloneNode(true);
          mainContent.innerHTML = '';
          mainContent.appendChild(inquiriesContent);
      }

          // Function to load the Payment Info template
      function loadPaymentInfoContent() {
          const mainContent = document.getElementById('mainContent');
          const paymentInfoTemplate = document.getElementById('paymentInfoTemplate');
          const paymentInfoContent = paymentInfoTemplate.content.cloneNode(true);
          mainContent.innerHTML = '';
          mainContent.appendChild(paymentInfoContent);
      }
   // Load Support content into the main content area
      function loadSupportContent() {
          const mainContent = document.getElementById('mainContent');
          const supportTemplate = document.getElementById('supportTemplate');
          const supportContent = supportTemplate.content.cloneNode(true);
          mainContent.innerHTML = '';
          mainContent.appendChild(supportContent);
      }

      // Handle New Ticket Form Submission
      document.addEventListener('DOMContentLoaded', () => {
          const newTicketForm = document.getElementById('newTicketForm');
          if (newTicketForm) {
              newTicketForm.addEventListener('submit', (event) => {
                  event.preventDefault();
                  const formData = new FormData(newTicketForm);

                  fetch(newTicketForm.action, {
                      method: 'POST',
                      body: formData
                  }).then(response => {
                      if (response.ok) {
                          alert('Ticket created successfully!');
                          bootstrap.Modal.getInstance(document.getElementById('newTicketModal')).hide();
                          newTicketForm.reset();
                      } else {
                          alert('Failed to create ticket.');
                      }
                  }).catch(error => {
                      console.error('Error:', error);
                  });
              });
          }

          // Handle Edit Ticket Form Submission
          const editTicketForm = document.getElementById('editTicketForm');
          if (editTicketForm) {
              editTicketForm.addEventListener('submit', (event) => {
                  event.preventDefault();
                  const formData = new FormData(editTicketForm);

                  fetch(editTicketForm.action, {
                      method: 'POST',
                      body: formData
                  }).then(response => {
                      if (response.ok) {
                          alert('Ticket updated successfully!');
                          bootstrap.Modal.getInstance(document.getElementById('editTicketModal')).hide();
                      } else {
                          alert('Failed to update ticket.');
                      }
                  }).catch(error => {
                      console.error('Error:', error);
                  });
              });
          }
      });
      // Load default content
      loadProfileContent();
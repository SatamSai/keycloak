// Function to check the aspect ratio
function checkAspectRatio() {
    const width = window.innerWidth;
    const height = window.innerHeight;
    const aspectRatio = width / height;

    const instructionDiv = document.querySelector(".rotate-instruction-container")

    if (aspectRatio < 1) {
        instructionDiv.style.display = 'flex';
    } else {
        instructionDiv.style.display = 'none';
    }
}

checkAspectRatio()

// Event listener for window resize
window.addEventListener('resize', checkAspectRatio);
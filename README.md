<div class="grid-container">
    <img src="ScreenShots/1.png" alt="Screenshot 1">
    <img src="ScreenShots/2.png" alt="Screenshot 2">
    <img src="ScreenShots/3.png" alt="Screenshot 3">
    <img src="ScreenShots/4.png" alt="Screenshot 4">
    <img src="ScreenShots/5.png" alt="Screenshot 5">
    <img src="ScreenShots/6.png" alt="Screenshot 6">
    <img src="ScreenShots/7.png" alt="Screenshot 7">
    <img src="ScreenShots/8.png" alt="Screenshot 8">
    <img src="ScreenShots/9.png" alt="Screenshot 9">
    <img src="ScreenShots/10.png" alt="Screenshot 10">
    <img src="ScreenShots/11.png" alt="Screenshot 11">
</div>

<style>
    .grid-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 10px;
    }

    img {
        max-width: 100%;
        width: 100%;
        height: auto;
    }

    @media (max-width: 768px) {
        .grid-container {
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        }
    }

    @media (max-width: 480px) {
        .grid-container {
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        }
    }
</style>

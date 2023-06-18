<div class="col-xs-24 col-sm-24 col-md-16 col-lg-16">
    <section class="timeline-cuocthi">
        <div class="timeline-title">
            <h3>10 Cuộc thi gần đây</h3>
        </div>
        <div id="recent_exams_list">
            <div class="slider" id="top10exams"></div>
        </div>

    </section>
</div>

<style>

    .exam_item .panel-heading {
        max-height: 100px;
        width: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .slider {
  display: flex;
  overflow-x: auto; /* Enable horizontal scrolling */
  scroll-snap-type: x mandatory; /* Snap to each slide */
}

.slide {
    width: 250px;
    flex: 0 0 250px; /* Each slide occupies full width of the container */
    scroll-snap-align: start; /* Snap to the start of each slide */
    padding: 10px; /* Optional padding between slides */
}

/* Optional: Style the scrollbar */
.slider::-webkit-scrollbar {
  width: 5px;
  height: 8px;
}

.slider::-webkit-scrollbar-thumb {
  background-color: #428bca;
  border-radius: 2.5px;
}

.slider::-webkit-scrollbar-track {
  background-color: #f2f2f2;
}

</style>

<script src="assets/js/examination/js-recent-exams.js"></script>
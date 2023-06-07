<?php if ($comments) { ?>
<?php foreach ($comments as $comment) { ?>
<div class="content"><b><?php echo $comment['author']; ?></b> | <?php echo date_change($comment['add_date']); ?><br />
  <br />
  <?php echo $comment['content']; ?></div>
<?php } ?>
<div class="pagination"><?php //echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php// echo $text_no_reviews; ?></div>
<?php } ?>

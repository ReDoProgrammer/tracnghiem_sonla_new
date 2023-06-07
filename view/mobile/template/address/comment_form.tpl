<div id="review"></div>
      <div class="heading" id="review_title"><?php echo $text_write; ?></div>
      <div class="content"><b><?php echo $entry_name; ?></b><br />
        <input type="text" name="name" value="" />
        <br />
        <br />
        <b><?php echo $entry_review; ?></b>
        <textarea name="text" style="width: 98%;" rows="8"></textarea>
        <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
        <br />
        <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
        <input type="radio" name="rating" value="1" style="margin: 0;" />
        &nbsp;
        <input type="radio" name="rating" value="2" style="margin: 0;" />
        &nbsp;
        <input type="radio" name="rating" value="3" style="margin: 0;" />
        &nbsp;
        <input type="radio" name="rating" value="4" style="margin: 0;" />
        &nbsp;
        <input type="radio" name="rating" value="5" style="margin: 0;" />
        &nbsp; <span><?php echo $entry_good; ?></span><br />
        <br />
        <b><?php echo $entry_captcha; ?></b><br />
        <input type="text" name="captcha" value="" autocomplete="off" />
        <br />
        <img src="" id="captcha" /></div>
      <div class="buttons">
        <table>
          <tr>
            <td align="right"><a onclick="review();" class="button"><span><?php echo $button_continue; ?></span></a></td>
          </tr>
        </table>
      </div>
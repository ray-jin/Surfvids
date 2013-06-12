<?php
$f_search = array(	//text field			
		'name'	=> 'f_search',			
	);
?>

<article class="module width_full">
    <header>
        <h3 class="tabs_involved"> Category List </h3>
        <div class="submit_link">
           <input type="submit" value="Add" class="alt_btn" onclick="return post_add()" />
        </div>
    </header>

    <div class="tab_container">
        <table class="tablesorter" cellspacing="0">
            <thead>
                <tr align="center">
                    <th width="30">No.</th>
                    <th >Name</th>
                    <th >Image</th>                    
                    <th >Price</th>
                    <th style="width : 100px; ">Number of Part</th>
                    <th >Video Info</th>
                    <th style="width : 120px; ">Actions</th>
                </tr>
            </thead> 
            <tbody> 
            <?php
            $i = 1;
            foreach($category_list as $row) {
                $video_info=$row['video_info'];
                if (strlen($row['video_info'])>230){
                    $video_info=substr($row['video_info'],0,230)."...";
                  //  $video_info=$row['video_info'];
                }
                
            ?>
                <tr >		
                    <td><?php echo $i; ?></td>
                    <td><?php echo $row['name'];?></td>
                    <td>
                        <?php
                            if ($row['image_url']!=""){
                        ?>
                            <img src="<?php echo IMAGE_PATH."/".$row['image_url'];?>" alt="<?php echo $row['name'];?>" height="80" width="80">
                        <?php
                            }
                            else{
                                echo "<div style='color:red'> No Image </div>";
                            }
                        ?>
                             
                    </td>
                    <td>$<?php echo $row['price'];?></td>
                    <td>
                        <?php
                            
                            $clip_count=$this->categories->get_clip_number_of_part($row['id']);
                           
                            if ($clip_count!=0){
                                echo $clip_count;
                        ?>

                        <?php
                            }
                            else{
                                echo "<div style='color:red'> No Video </div>";
                            }
                        ?>
                    </td>
                    <td><?php echo $video_info?></td>
                    
                    <td style="width : 120px; ">
                        <input type="image" title="Edit" style="vertical-align: middle;" src="<?php echo IMG_DIR; ?>/icn_edit.png" onclick="goedit(<?php echo $row['id'];?>)">
                        <input type="image" title="Trash" style="vertical-align: middle;" src="<?php echo IMG_DIR; ?>/icn_trash.png" onclick="confirm_del(<?php echo $row['id'];?>)">
                        <input type="image" title="Comment" style="vertical-align: middle;" weight="16px;" height="16px;" src="<?php echo IMG_DIR; ?>/icn_comment.png" onclick="gocomment(<?php echo $row['id'];?>)">
                    </td>			
                </tr>
            <?php
                $i++;
            }
            if($i==0) {
                    echo "<tr><td colspan='7' align='center'>Nothing </td></tr>";
            }
            ?>
            </tbody>
          
        </table>
    </div>

    <script type="text/javascript">
            function post_add() {
                    window.location.href = "<?php echo site_url("$post_key"."/".$post_key."_add"); ?>";
                    return false;
            }
            function confirm_del(pid) {
                    if(!confirm('Are you sure to delete?')) {
                            return;
                    }
                    window.location.href = "<?php echo site_url("$post_key"."/".$post_key."_del"); ?>/" + pid;
            }
            function goedit(pid) {
                    window.location.href = "<?php echo site_url("$post_key"."/".$post_key."_edit"); ?>/" + pid;
            }
            function gocomment(pid) {
                    window.location.href = "<?php echo site_url("$post_key"."/".$post_key."_comment"); ?>/" + pid;
            }
    </script>

    <footer>
        <?php echo $pagenation; ?>
    </footer>
</article>
<button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>"
        class="btn btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i>
    <span
            id="cart-total"><?php echo $text_items; ?></span>
</button>
<ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
        <li>

            <div class="col-12">
                <p class="text-right">
                    <a class="btn btn-success" href="<?php echo $checkout; ?>">
                        <i class="fa fa-share"></i> <?php echo $text_checkout; ?>
                    </a>
                </p>
            </div>

            <table class="table table-striped table-sm">
                <?php foreach ($products as $product) { ?>

                    <tr>
                        <td colspan="4">
                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            <strong>&times;</strong> <?php echo $product['quantity']; ?>
                            <?php if ($product['option']) { ?>
                                <?php foreach ($product['option'] as $option) { ?>
                                    <br/>
                                    -
                                    <small><?php echo $option['name']; ?><?php echo $option['value']; ?></small>
                                <?php } ?>
                            <?php } ?>
                            <?php if ($product['recurring']) { ?>
                                <br/>
                                -
                                <small><?php echo $text_recurring; ?><?php echo $product['recurring']; ?></small>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-center"><?php if ($product['thumb']) { ?>
                                <a class="image" href="<?php echo $product['href']; ?>">
                                    <img src="<?php echo $product['thumb']; ?>"
                                         alt="<?php echo $product['name']; ?>"
                                         title="<?php echo $product['name']; ?>"
                                         class="img-thumbnail"/></a>
                            <?php } ?></td>

                        <td class="text-right"><?php echo $product['price_enduser_total_formatted']; ?></td>
                        <td class="text-center">
                            <button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"
                                    title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i
                                        class="fa fa-times"></i></button>
                        </td>
                    </tr>
                <?php } ?>
                <?php foreach ($vouchers as $voucher) { ?>
                    <tr>
                        <td class="text-center"></td>
                        <td class="text-left"><?php echo $voucher['description']; ?></td>
                        <td class="text-right"><?php echo $voucher['amount']; ?></td>
                        <td class="text-center text-danger">
                            <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"
                                    title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i
                                        class="fa fa-times"></i></button>
                        </td>
                    </tr>
                <?php } ?>
            </table>
        </li>
        <li>
            <div>
                <table class="table table-bordered table-sm">
                    <?php foreach ($totals as $total) { ?>
                        <tr>
                            <td class="text-right<?=($total=='total'?' font-weight-bold':'')?>"><small><?php echo $total['title']; ?></small></td>
                            <td class="text-right<?=($total=='total'?' font-weight-bold':'')?>"><?php echo $total['text']; ?></td>
                        </tr>
                    <?php } ?>
                </table>
            </div>
        </li>
    <?php } else { ?>
        <li>
            <p class="text-center"><?php echo $text_empty; ?></p>
        </li>
    <?php } ?>
</ul>


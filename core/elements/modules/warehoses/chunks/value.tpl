{if $unit == "упаковка"}
    {set $unit_declension = "уп."}
    {set $counts = ["start" => 50, "end" => 500]}
{elseif $unit == "лист"}
    {set $unit_declension = $count | declension : 'л.|л.|л.'}
    {set $counts = ["start" => 500, "end" => 2000]}
{else}
    {set $unit_declension = "шт."}
    {set $counts = ["start" => 50, "end" => 500]}
{/if}

{set $count = "@FILE snippets/random.php" | snippet : [
    "id" => $unique_id,
    "start" => $counts['start'],
    "end" => $counts['end'],
]} 

{$count} {$unit_declension}
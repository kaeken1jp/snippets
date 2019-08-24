<table cellpadding="4" cellspacing="1" style="margin-left:25px;">
<tr bgcolor="#EEEEEE">
<th>
Entry
</th>

<th>
Description
</th>

<th>
Equivalent To
</th>
</tr>

<tr>
<td>
@reboot
</td>

<td>
Run once, at startup.
</td>

<td>
None
</td>
</tr>

<tr>
<td>
@yearly
</td>

<td>
Run once a year
</td>

<td>
0 0 1 1 *
</td>
</tr>

<tr>
<td>
@annually
</td>

<td>
(same as @yearly)
</td>

<td>
0 0 1 1 *
</td>
</tr>

<tr>
<td>
@monthly
</td>

<td>
Run once a month
</td>

<td>
0 0 1 * *
</td>
</tr>

<tr>
<td>
@weekly
</td>

<td>
Run once a week
</td>

<td>
0 0 * * 0
</td>
</tr>

<tr>
<td>
@daily
</td>

<td>
Run once a day
</td>

<td>
0 0 * * *
</td>
</tr>

<tr>
<td>
@midnight
</td>

<td>
(same as @daily)
</td>

<td>
0 0 * * *
</td>
</tr>

<tr>
<td>
@hourly
</td>

<td>
Run once an hour
</td>

<td>
0 * * * *
</td>
</tr>
</table>

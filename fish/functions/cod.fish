function cod --description 'Start code in a new tab. Restore container layout when finished.'
    i3-msg --quiet split horizontal
    i3-msg --quiet layout tabbed
    code --wait $argv[1..-1]
    i3-msg --quiet layout default
end

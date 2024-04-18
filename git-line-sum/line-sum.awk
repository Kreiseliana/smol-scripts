/files? changed/ { files += $1; insertion += $4; deletion += $6 }
END { print files " files changed, " insertion " insertions(+), " deletion " deletion(-)" }


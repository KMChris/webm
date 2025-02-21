# Video Processing Scripts

These batch scripts help convert, trim, and join video files easily.

## The Conversion Script

The `convert.bat` script converts all `.webm` files `.mp4` from the last hour using ffmpeg.
Run the script in the folder containing the `.webm` files to convert them.

## How to Use Studio

The `studio` folder contains scripts for trimming and joining videos.

### With Trimming
1. Run `convert.bat` to convert all `.webm` files in the current directory to `.mp4`.
   - Converted files are saved in the `output` folder.
2. Drag and drop a video file onto `output/trim.bat` to trim it.
3. Run `join_mp4.bat` to merge all trimmed `.mp4` files in the `output` folder into `output.mp4`.

### Without Trimming
- Run `join.bat` to convert and join `.webm` files to `output.mp4` in one step.
- Run `join_copy.bat` to merge `.mp4` files without re-encoding.
- Run `join_webm.bat` to merge `.webm` files into a single `.webm` file.

## Requirements
- `ffmpeg` must be installed and available in the system's PATH.

## Notes
- Make sure all video files are in the correct format before joining.
- No re-encoding means the videos must have the same format and codec.

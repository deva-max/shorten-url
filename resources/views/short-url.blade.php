@extends('layouts.app')

@section('content')
    <title>Generate Short URL</title>
    <div class="container mt-5">
        <h2 class="mb-4">Generate Short URL</h2>
        <!-- Form to input long URL -->
        <form id="short-url-form">
            <div class="mb-3">
                <label for="long_url" class="form-label">Enter Long URL</label>
                <input type="url" class="form-control" id="long_url" name="long_url" placeholder="https://example.com" required>
                <div class="invalid-feedback" id="url-error"></div>
            </div>
            <button type="submit" class="btn btn-primary">Generate</button>
        </form>

        <!-- Section to display the generated short URL -->
        <div class="mt-4" id="result" style="display: none;">
            <h5>Short URL:</h5>
            <a href="#" target="_blank" id="short-url"></a>
        </div>
    </div>

    

    <script>
        $(document).ready(function () {
            $('#short-url-form').on('submit', function (e) {
                e.preventDefault(); // Prevent form from submitting normally

                let longUrl = $('#long_url').val();
                let csrfToken = $('meta[name="csrf-token"]').attr('content');

                // Clear any previous error
                $('#url-error').text('').removeClass('d-block');

                // AJAX POST request to generate the short URL
                $.ajax({
                    url: '{{ route("short-url.generate") }}',
                    method: 'POST',
                    headers: { 'X-CSRF-TOKEN': csrfToken },
                    data: { long_url: longUrl },
                    success: function (response) {
                        $('#result').show();
                        $('#short-url').attr('href', response.short_url).text(response.short_url);
                    },
                    error: function (xhr) {
                        if (xhr.responseJSON && xhr.responseJSON.errors) {
                            $('#url-error').text(xhr.responseJSON.errors.long_url[0]).addClass('d-block');
                        }
                    }
                });
            });
        });
    </script>

@endsection

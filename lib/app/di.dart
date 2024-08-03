import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/app/provider/local_storage_provider.dart';
import 'package:my_app/app/repository/camera_repository.dart';
import 'package:my_app/gallery/bloc/gallery_bloc.dart';
import 'package:my_app/gallery/bloc/gallery_event.dart';

class DI extends StatelessWidget {
  const DI({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _ProviderDI(
      child: _RepositoryDI(
        child: _BlocDI(
          child: child,
        ),
      ),
    );
  }
}

class _ProviderDI extends StatelessWidget {
  const _ProviderDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalStorageProvider>(
          create: (context) => LocalStorageProvider(),
        ),
      ],
      child: child,
    );
  }
}

class _RepositoryDI extends StatelessWidget {
  const _RepositoryDI({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CameraRepository>(
          create: (context) => CameraRepository(
              localStorageProvider: context.read<LocalStorageProvider>()),
        ),
      ],
      child: child,
    );
  }
}

class _BlocDI extends StatelessWidget {
  const _BlocDI({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GalleryBloc(
            cameraRepository: context.read<CameraRepository>()
          )..add(LoadGallery()),
        ),
      ],
      child: child,
    );
  }
}
